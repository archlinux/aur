# Maintainer: Ramadan Ali (alicavus) <rot13: ezqa@ezqa.ny>
# Contributor: phillipk

pkgname=naps2-bin
pkgver=7.4.0
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
b2sums_x86_64=("c8c32af37f72c44d75c1ddfc14b9421c716448acf519b5818a486808334d49f1570f6ada47779dad29215e49c6e540f3d7f6cd61c4fa1ef46a5839367d1aca3a")

package() {
  cd "${pkgdir}"
  bsdtar -x -v -f "${srcdir}/data.tar.xz"
  # Fix filesystem permissions
  find . -type d -exec chmod -v 0755 {} \;
}
