# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=geoip2-csv-converter-bin
pkgver=1.5.0
pkgrel=1
pkgdesc="Convert GeoIP2 CSV files to other formats"
arch=('x86_64' 'aarch64')
url="https://github.com/maxmind/geoip2-csv-converter"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/geoip2-csv-converter_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/geoip2-csv-converter_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('f91b6608199c2228f1420e7136a4b36d4d5314cff848f2d2d12109af8148f08b')
sha256sums_aarch64=('a31f7e9ee5755264c9c330c88a7c0f21c722d34310d39c9fd542f67565145724')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="geoip2-csv-converter_${pkgver}_linux_amd64" ;;
    aarch64) _dir="geoip2-csv-converter_${pkgver}_linux_arm64" ;;
  esac
  install -Dm755 "${_dir}/geoip2-csv-converter" "${pkgdir}/usr/bin/geoip2-csv-converter"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
