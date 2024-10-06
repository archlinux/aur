# Maintainer: Ramadan Ali (alicavus) <rot13: ezqa@ezqa.ny>
# Contributor: phillipk
# Contributor: jthvai

pkgname=naps2-bin
pkgver=7.5.2
pkgrel=1
pkgdesc="NAPS2 - Not Another PDF Scanner. Scan documents to PDF and more, as simply as possible."
arch=("aarch64" "x86_64")
url="https://www.naps2.com"
license=("GPL-2.0-or-later")
depends=("sane" "gtk3")
optdepends=(
  "sane-airscan: airscan support"
)
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=("!strip" "!debug")
source_aarch64=("https://github.com/cyanfish/${pkgname%-bin}/releases/download/v$pkgver/${pkgname%-bin}-$pkgver-linux-arm64.rpm")
source_x86_64=("https://github.com/cyanfish/${pkgname%-bin}/releases/download/v$pkgver/${pkgname%-bin}-$pkgver-linux-x64.rpm")

b2sums_aarch64=("a61f4d36c19380c64298f12f94aaaf2a3d59c73d69df70d569e91e71d7c08a667d5c62dbb998f9bb5d4a5fb3957f7ac4549e63bb523794b3420cdec5830084d8")
b2sums_x86_64=("7e13e27928fca3dade4deaabeb55aac9c65472f062185025304e793508d5a12dff525a546e9bc7c74fe522b17c6d9799ed2b3880b04062c6a6babbf27cbef8d8")

package() {
  rm -r "${srcdir}/usr/lib/.build-id"
  mv "${srcdir}/usr" "${pkgdir}/usr"
}
