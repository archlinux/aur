# Maintainer:  Alad Wenter <alad@mailbox.org>
pkgname=cottage-git
pkgver=0.3.r0.g79f4476
pkgrel=1
pkgdesc="Use howm commands, operators and set configuration values through a UNIX socket."
url="https://github.com/HarveyHunt/cottage"
license=('GPL')
arch=('i686' 'x86_64')
source=("$pkgname::git+https://github.com/HarveyHunt/cottage")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/^v//; s/-/.r/; s/-/./'
}

build() {
  cd "$pkgname"
  make debug
}

package() {
  cd "$pkgname"
  install -Dm755 cottage "$pkgdir/usr/bin/cottage"
}

# vim:set ts=2 sw=2 et:
