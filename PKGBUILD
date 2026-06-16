# Maintainer: Uladzislau Bolbas <cmrtumilovic@gmail.com>

pkgname=gisp
pkgver=1.0
pkgrel=1
pkgdesc="File encryption utility using XChaCha20-Poly1305 and Argon2id"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://codeberg.org/artich0ke/gisp"
license=('GPL3')
depends=('libsodium')
makedepends=('gcc' 'make')
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/artich0ke/gisp/archive/v${pkgver}.tar.gz")
sha256sums=('ff8347bfa2ce4c4a580bdf5b81a0c9669c2e839ded17e07407291f9fee3bf487')

build() {
  cd "gisp"
  make
}

check() {
  cd "gisp"
  make test
}

package() {
  cd "gisp"
  make DESTDIR="$pkgdir" PREFIX=/usr install
}
