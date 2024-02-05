# Maintainer: Ramadan Ali (alicavus) <rot13: ezqa@ezqa.ny>
# Contributor: phillipk

pkgname=naps2-bin
pkgver=7.3.1
pkgrel=1
pkgdesc="NAPS2 - Not Another PDF Scanner. Scan documents to PDF and more, as simply as possible."
arch=(x86_64)
url="https://www.naps2.com"
license=("GPL-2.0-or-later")
depends=(sane)
optdepends=(
  "sane-airscan: airscan support"
)
provides=(${pkgname%-bin})
options=(!strip)
source_x86_64=("https://github.com/cyanfish/${pkgname%-bin}/releases/download/v$pkgver/${pkgname%-bin}-$pkgver-linux-x64.deb")
b2sums_x86_64=("229c163629b1f06f3f0d95441bfabbf91f741ad632d652d1a63b5082cf4dd093fe9a2acdf0aea24bba780bc88e31d1c906068a801d2237420a8695fdfe9004f5")

package() {
  cd "${pkgdir}"
  bsdtar -x -v -f "${srcdir}/data.tar.xz"
  # Fix filesystem permissions
  find . -type d -exec chmod -v 0755 {} \;
}
