# Maintainer: Uladzislau Bolbas <cmrtumilovic@gmail.com>

pkgname=gisp
pkgver=1.0
pkgrel=1
pkgdesc="Industrial-grade file encryption utility using XChaCha20-Poly1305 and Argon2id"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://github.com/b0lbas/gisp"
license=('GPL3')
depends=('libsodium')
makedepends=('gcc' 'make')
source=("$pkgname-$pkgver.tar.gz::https://github.com/b0lbas/gisp/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ce0f8d76fe11d8f18417e5591b40eeeae56e196b8b20193fe435fb14ec9bed65')

build() {
  cd "$pkgname-$pkgver"
  make
}

check() {
  cd "$pkgname-$pkgver"
  make test
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" PREFIX=/usr install
}
