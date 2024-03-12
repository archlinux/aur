# Maintainer: Jonathan Neidel <aur at jneidel dot com>

pkgname=ain-bin
pkgver="1.4.1"
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
sha256sums_aarch64=("0c376a59febc7d714720c20a5a8c60207ced4ed14d95fee2540c511d804ae048")
sha256sums_x86_64=("17090ecd1c07764c46729902f46e7294430852ddf4dbdc512f36dd659414a5ad")
sha256sums_i386=("a6e0a3c6bb003f3ba233fb46523d6fe8a260dc4f21722232db4ae67792085050")

package() {
  case $CARCH in
    x86_64|i386) cd "$srcdir/ain_${pkgver}_linux_${CARCH}";;
    aarch64) cd "$srcdir/ain_${pkgver}_linux_arm64";;
  esac
  mkdir -p "$pkgdir/usr/bin"
  cp ain "$pkgdir/usr/bin/ain"
}
