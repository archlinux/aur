# Maintainer: Jonathan Neidel <aur at jneidel dot com>

pkgname=ain-bin
pkgver=1.3.0
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
sha256sums_aarch64=("4d4552d39bb96d13f725cbd0331991369f8cbce8764321571f44b36b06f01f68")
sha256sums_x86_64=("f5e80b7b9c72b6d9411215935261528afa559f57040bba87d8511b0a5d548ded")
sha256sums_i386=("6152c6696c3fe2c091c8fa8565f2b8b9eff5178cb4da751c3d801ffc6680c769")

package() {
  case $CARCH in
    x86_64|i386) cd "$srcdir/ain_${pkgver}_linux_${CARCH}";;
    aarch64) cd "$srcdir/ain_${pkgver}_linux_arm64";;
  esac
  mkdir -p "$pkgdir/usr/bin"
  cp ain "$pkgdir/usr/bin/ain"
}
