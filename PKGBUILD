# Maintainer: Jonathan Neidel <aur at jneidel dot com>

pkgname=ain-bin
pkgver=1.2.2
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
sha256sums_aarch64=("775046abba74e3213e2a1fad12e274850c9e321318bf89a39db0c1b7567418f5")
sha256sums_x86_64=("88a08fd9995c892972814980dbaed0f68d5f27d7dc78e3d21841e4b47889afa2")
sha256sums_i386=("faa8eb730a03d1ff1868204f982d848870a301a3a58eb49c13d7e4e4298ccfa3")

package() {
  case $CARCH in
    x86_64|i386) cd "$srcdir/ain_${pkgver}_linux_${CARCH}";;
    aarch64) cd "$srcdir/ain_${pkgver}_linux_arm64";;
  esac
  mkdir -p "$pkgdir/usr/bin"
  cp ain "$pkgdir/usr/bin/ain"
}
