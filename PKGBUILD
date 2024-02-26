# Maintainer: Jonathan Neidel <aur at jneidel dot com>

pkgname=ain-bin
pkgver=1.4.0
pkgrel=1
pkgdesc="A HTTP API client for the terminal. An alternative to postman, paw or insomnia."
arch=(x86_64 aarch64 i386)
url="https://github.com/jonaslu/ain"
license=(MIT)
depends=()
makedepends=()
optdepends=()
provides=(ain)
source_aarch64=("https://github.com/jonaslu/ain/releases/download/v${pkgver}/ain_${pkgver}_linux_arm64.tar.gz")
source_x86_64=("https://github.com/jonaslu/ain/releases/download/v${pkgver}/ain_${pkgver}_linux_x86_64.tar.gz")
source_i386=("https://github.com/jonaslu/ain/releases/download/v${pkgver}/ain_${pkgver}_linux_i386.tar.gz")
sha256sums_aarch64=("6b559930f183f5e448b68d4b6ab62b39d04cf3c232029c1d848125e7560b65f5")
sha256sums_x86_64=("3471e96382210086fa19810cfb93011a28ee5dfb72bef61966d58cd775737ef0")
sha256sums_i386=("688f740fcdd3f5015d099f162b9acbd6268f277cc3be8cdaeeada2985fb7ff71")

package() {
  case $CARCH in
    x86_64|i386) cd "$srcdir/ain_${pkgver}_linux_${CARCH}";;
    aarch64) cd "$srcdir/ain_${pkgver}_linux_arm64";;
  esac
  mkdir -p "$pkgdir/usr/bin"
  cp ain "$pkgdir/usr/bin/ain"
}
