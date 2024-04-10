# Maintainer: Ramadan Ali (alicavus) <rot13: ezqa@ezqa.ny>
# Contributor: phillipk

pkgname=naps2-bin
pkgver=7.4.1
pkgrel=1
pkgdesc="NAPS2 - Not Another PDF Scanner. Scan documents to PDF and more, as simply as possible."
arch=("aarch64" "x86_64")
url="https://www.naps2.com"
license=("GPL-2.0-or-later")
depends=("sane")
optdepends=(
  "sane-airscan: airscan support"
)
provides=("${pkgname%-bin}")
options=("!strip" "!debug")
source_aarch64=("https://github.com/cyanfish/${pkgname%-bin}/releases/download/v$pkgver/${pkgname%-bin}-$pkgver-linux-arm64.deb")
source_x86_64=("https://github.com/cyanfish/${pkgname%-bin}/releases/download/v$pkgver/${pkgname%-bin}-$pkgver-linux-x64.deb")
b2sums_aarch64=("e72573f4965479890cff689a1fe385b4be375006913bfd471f66d044f719a745b014ef57d25b96093ccd3609b48f6e5aeeaadd81c01b82f82e273ce899a6d753")
b2sums_x86_64=("a0029f056b527ca4d269d285fb62649d412124ced7b7a667b61c20baaed60fe5f599b29a0f863fc86dde165c1d5a712e4ed8a86d5a94433d8d74fccb4f7f92a3")

package() {
  cd "${pkgdir}"
  bsdtar -x -v -f "${srcdir}/data.tar.xz"
  # Fix filesystem permissions
  find . -type d -exec chmod -v 0755 {} \;
}
