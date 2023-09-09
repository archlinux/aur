# Maintainer: Ramadan Ali (alicavus) <rot13: ezqa@ezqa.ny>

pkgname=naps2-bin
pkgver=7.1.0
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
b2sums_x86_64=("ec1b65ebd01459bf736e1bdb8f128f4cf12ce21bee1ec7e1ed48c4a8f617eb227634188f24f4b74ea63c9d7b5255ae1d4f7a8275d1c1c381a3e3fe9ea36b758e")

package() {
  cd "${pkgdir}"
  bsdtar -x -v -f "${srcdir}/data.tar.xz"
  # Fix directory permissions
  find . -type d -exec chmod -v 0755 {} \;
}
