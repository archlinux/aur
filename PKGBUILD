# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=thingspanel-backend-community-bin
pkgver=1.4.0
pkgrel=1
pkgdesc="Backend server for the ThingsPanel IoT platform"
arch=('x86_64' 'aarch64')
url="https://github.com/ThingsPanel/thingspanel-backend-community"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/ThingsPanel/thingspanel-backend-community/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/thingspanel-backend-community-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/thingspanel-backend-community-linux-arm64.tar.gz")
sha256sums=('4691ae29626cb29c623b497d2d7a727b4520d9a44c577053fec315e241ecfe04')
sha256sums_x86_64=('54f8220c8e91662f2ccfe57fa638164e335bf11ffc79cb04cfbfdd8325300ed7')
sha256sums_aarch64=('252bef474e5f2d462dcae7c6a43dd26f5299131fc4e1327d42804da41e40535f')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="linux-amd64" ;;
    aarch64) _dir="linux-arm64" ;;
  esac
  install -Dm755 "${_dir}/thingspanel-backend-community" "${pkgdir}/usr/bin/thingspanel-backend-community"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
