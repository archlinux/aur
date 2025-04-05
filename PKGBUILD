# Maintainer: Ramadan Ali (alicavus) <rot13: ezqa@ezqa.ny>
# Contributor: phillipk
# Contributor: jthvai

pkgname=naps2-bin
pkgver=8.1.3
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

b2sums_aarch64=("ceb7322b5d7bd8456a68e46e9e0f534cdf23b18f3c53ee2e9de53294490fbc59486979dc946fbd88903360cc13ff6db7e8e9bfe123e1dceeaa6cf9831d4b3343")
b2sums_x86_64=("35e8a7e37edd24eb6c2b746d25ce2fb3f07d1a82d9d0165b75fcde0b4820d5f9d25d4b8aabbdb5311a8ec214121db19705a0e0ec4aec54a0f92855dba779598d")

package() {
  rm -r "${srcdir}/usr/lib/.build-id"
  mv "${srcdir}/usr" "${pkgdir}/usr"
}
