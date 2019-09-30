# Maintainer: Thibaut Sautereau (thithib) <thibaut at sautereau dot fr>

pkgname=hardened_malloc
pkgver=2
pkgrel=2
pkgdesc="Hardened allocator designed for modern systems"
arch=('x86_64')
url="https://github.com/GrapheneOS/hardened_malloc"
license=('MIT')
makedepends=('git')
conflicts=('hardened-malloc-git')
source=("git+https://github.com/GrapheneOS/$pkgname#tag=$pkgver?signed")
sha256sums=('SKIP')
validpgpkeys=('65EEFE022108E2B708CBFCF7F9E712E59AF5F22A') # Daniel Micay <danielmicay@gmail.com>

build() {
  cd "$pkgname"
  make
}

package() {
  cd "$pkgname"
  install -Dm755 --target-directory="$pkgdir/usr/lib" libhardened_malloc.so
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
