# Maintainer: Boris Timofeev <btimofeev@emunix.org>
pkgname=insteadman
pkgver=3.1.2
pkgrel=3
pkgdesc="Manager for INSTEAD interpreter."
arch=('i686' 'x86_64')
url="https://github.com/jhekasoft/insteadman"
license=('MIT')
depends=('instead')
makedepends=('go')
source=("https://github.com/jhekasoft/insteadman/archive/v$pkgver.tar.gz")
sha256sums=('a821eec1191c56e6ce897b07db32704a63acd9aabf443c174452584134cfdb3f')

build() {
  cd "$srcdir/insteadman-$pkgver"
  GOPATH=`pwd`/.. make
}

package() {
  cd "$srcdir/insteadman-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
