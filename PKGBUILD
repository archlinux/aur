# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=gocsv-bin
pkgver=1.0.9
pkgrel=1
pkgdesc="Command-line CSV processing utility"
arch=('x86_64' 'aarch64')
url="https://github.com/aotimme/gocsv"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/aotimme/gocsv/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::${_dl}/gocsv-linux-amd64.zip")
source_aarch64=("${pkgname}-${pkgver}-aarch64.zip::${_dl}/gocsv-linux-arm64.zip")
sha256sums=('a881934e68c810d9f959fd8ff069a3717372b0f914cf6130c84f83d6ef4420c5')
sha256sums_x86_64=('becf1002c71a09b25087cdc61e2afa66e5cd96acd5bee3e73eee1b4279125b77')
sha256sums_aarch64=('18c81ceec39f492169e853c7fc9f8d50b22b79981f420f72f2d46188dbdea083')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="gocsv-linux-amd64" ;;
    aarch64) _dir="gocsv-linux-arm64" ;;
  esac
  install -Dm755 "${_dir}/gocsv" "${pkgdir}/usr/bin/gocsv"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
