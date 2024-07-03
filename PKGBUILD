# Maintainer: Jonathan Neidel <aur at jneidel dot com>

pkgname=ain-bin
pkgver="1.5.0"
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
sha256sums_aarch64=("5d64ee7c7100db587a2cb47bdc0ca35c793793f8fffaa9a5432e260a64d88ff1")
sha256sums_x86_64=("1bb794c84e7d442e66164ddf78296d6150ab61d12593f4c9ee6f013418250745")
sha256sums_i386=("fdcbc8e59f22a1f3cc5be009c1b07f57487e76980da607be9b283c70c389be27")

package() {
  case $CARCH in
    x86_64|i386) cd "$srcdir/ain_${pkgver}_linux_${CARCH}";;
    aarch64) cd "$srcdir/ain_${pkgver}_linux_arm64";;
  esac
  mkdir -p "$pkgdir/usr/bin"
  cp ain "$pkgdir/usr/bin/ain"
}
