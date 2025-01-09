pkgname=z180emu-git
pkgver=1.0
pkgrel=1
pkgdesc="A portable full system emulator for Z180 based boards"
arch=('any')
url="https://github.com/gnarz/z180emu"
license=('GPL')
makedepends=('gcc' 'make' 'git')
source=("z180emu::git+https://github.com/gnarz/z180emu")
sha256sums=('SKIP')

build() {
  cd "$srcdir/z180emu"
  make
}

package() {
  cd "$srcdir/z180emu"
  install -Dm755 p112 "$pkgdir/usr/bin/p112"
  install -Dm755 markiv "$pkgdir/usr/bin/markiv"
  install -Dm755 makedisk "$pkgdir/usr/bin/makedisk"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# vim: set ts=2 sw=2 et:
