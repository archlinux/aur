# Maintainer: Ramadan Ali (alicavus) <rot13: ezqa@ezqa.ny>
# Contributor: phillipk
# Contributor: jthvai

pkgname=naps2-bin
pkgver=8.1.1
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

b2sums_aarch64=("a2328fc08a4d94df957c644431483561c5bf51f495e7468c3bb855c003f708060fad210177fd22811a019cc6ec2227ac498d51bcb22347aa7ee4485f86d19819")
b2sums_x86_64=("03be1773e8badf7aa837ed00b88dd125fcf5a3cdef282208153e46950eb57e2436653288b24bcbb62398c8f72756f04515898214ea086877ed7e9bae2ffaff4b")

package() {
  rm -r "${srcdir}/usr/lib/.build-id"
  mv "${srcdir}/usr" "${pkgdir}/usr"
}
