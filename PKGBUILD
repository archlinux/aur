# Maintainer: Ramadan Ali (alicavus) <rot13: ezqa@ezqa.ny>
# Contributor: phillipk
# Contributor: jthvai

pkgname=naps2-bin
pkgver=7.5.0
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

b2sums_aarch64=("d3bae5f32867576a5d7d6589f9285cc82626f5f9a9b8cdbe6405ba7b5e0abb439248b0cfb41091f75130d71704f9024128423b893f5405cd11ee6cadc32d7f7f")
b2sums_x86_64=("bd4216128473630dfd64e519fcc6e91ea98eb49818526f5bd4ff302f1f5e8fef1b5fe60e00b38730905773ae653324584bc29deb9bb584c8bd367195758ba473")

package() {
  rm -r "${srcdir}/usr/lib/.build-id"
  mv "${srcdir}/usr" "${pkgdir}/usr"
}
