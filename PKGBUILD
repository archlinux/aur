# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=webreaper-bin
pkgver=11.3.2
pkgrel=1
pkgdesc="AI-native web scraper"
arch=('x86_64' 'aarch64')
url="https://github.com/alex-on-ai/WebReaper"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/webreaper-v${pkgver}-linux-x64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/webreaper-v${pkgver}-linux-arm64.tar.gz")
sha256sums_x86_64=('a57877b5c315d76e3f3831614e5e682940a0fd47c12f734b5c2dbcb720d9ebb2')
sha256sums_aarch64=('351da1dab79b6c2a0e4b29fe33a5d53566496deb8ee0f892cad9362ddd0eb039')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="webreaper-v${pkgver}-linux-x64" ;;
    aarch64) _dir="webreaper-v${pkgver}-linux-arm64" ;;
  esac
  install -Dm755 "${_dir}/webreaper" "${pkgdir}/usr/bin/webreaper"
  install -Dm644 "${_dir}/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
