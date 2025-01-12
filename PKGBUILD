# Maintainer: Ramadan Ali (alicavus) <rot13: ezqa@ezqa.ny>
# Contributor: phillipk
# Contributor: jthvai

pkgname=naps2-bin
pkgver=7.5.3
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

b2sums_aarch64=("6785a8e79bffb11f2b27c87d40a36038242a6694c3e5bd5ace5f5c2f18974f9659b8cdf1d3f37c30877b22c85d753137d392d92d06185855071487d74521ea2a")
b2sums_x86_64=("1d5c39230895740c01dcfdec440d8b1da93778a8ff7b60b8ac92d4ec0045c7f01194a2d47d5707429ae71f39f77a7d753dcd61d9c750bad53ddca878761a7616")

package() {
  rm -r "${srcdir}/usr/lib/.build-id"
  mv "${srcdir}/usr" "${pkgdir}/usr"
}
