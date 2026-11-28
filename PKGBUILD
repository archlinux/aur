# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=ultrafocus-bin
pkgver=0.3.3
pkgrel=1
pkgdesc="Block distracting websites to boost productivity"
arch=('x86_64' 'aarch64')
url="https://github.com/plutov/ultrafocus"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/ultrafocus-v${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/ultrafocus-v${pkgver}-linux-arm64.tar.gz")
sha256sums_x86_64=('a336fe61aeaf2d56cc30a949b73443bc00468db47d326821988ccb6f109fd973')
sha256sums_aarch64=('72ffff1c2b5d82f2fd778475eb670818fb8a1a85ed065987ea734e03a35ce7d7')

package() {
  install -Dm755 "ultrafocus" "${pkgdir}/usr/bin/ultrafocus"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
