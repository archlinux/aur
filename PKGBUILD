# Maintainer: Ramadan Ali (alicavus) <rot13: ezqa@ezqa.ny>
# Contributor: phillipk

pkgname=naps2-bin
pkgver=7.4.2
pkgrel=2
pkgdesc="NAPS2 - Not Another PDF Scanner. Scan documents to PDF and more, as simply as possible."
arch=("aarch64" "x86_64")
url="https://www.naps2.com"
license=("GPL-2.0-or-later")
depends=("sane")
optdepends=(
  "sane-airscan: airscan support"
)
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=("!strip" "!debug")
source_aarch64=("https://github.com/cyanfish/${pkgname%-bin}/releases/download/v$pkgver/${pkgname%-bin}-$pkgver-linux-arm64.rpm")
source_x86_64=("https://github.com/cyanfish/${pkgname%-bin}/releases/download/v$pkgver/${pkgname%-bin}-$pkgver-linux-x64.rpm")
b2sums_aarch64=("1b947996e47514cc72611c2622fecfd2ba2b9b4159444ec2fe205d86b977c95d3612e4161d69c4f28804f996e3be12b83a7b30a00a06aba690d45930008fd9bf")
b2sums_x86_64=("ee5b1ac8cba04db11f3aee48eaf5817a3f61e85b8e4cf9a5b8fefb535ff20810295904e8b199b4457496d246ac379f5d450e496b68fd2e8d61928b3199b1d729")

package() {
  rm -r "${srcdir}/usr/lib/.build-id"
  mv "${srcdir}/usr" "${pkgdir}/usr"
}
