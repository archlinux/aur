# Maintainer: Ramadan Ali (alicavus) <rot13: ezqa@ezqa.ny>

pkgname=naps2-bin
pkgver=7.1.1
pkgrel=1
pkgdesc="NAPS2 - Not Another PDF Scanner. Scan documents to PDF and more, as simply as possible."
arch=(x86_64)
url="https://www.naps2.com"
license=(GPL2)
depends=(sane)
optdepends=(
  "sane-airscan: airscan support"
)
provides=(${pkgname%-bin})
options=(!strip)
source_x86_64=("https://github.com/cyanfish/${pkgname%-bin}/releases/download/v$pkgver/${pkgname%-bin}-$pkgver-linux-x64.deb")
b2sums_x86_64=("6bc6dd1cd42cf4fa89ca1caa7666a0d981d3cb28ad09deb5bab3805930fca72f1851a8bf906f0d3ca292f18aab23ccd7ff557d293cba02ad6910493870787453")

package() {
  cd "${pkgdir}"
  bsdtar -x -v -f "${srcdir}/data.tar.xz"
  # Fix directory permissions
  find . -type d -exec chmod -v 0755 {} \;
}
