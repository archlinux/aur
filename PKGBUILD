# Maintainer: Boris Timofeev <btimofeev@emunix.org>
pkgname=insteadman
pkgver=3.1.1
pkgrel=1
pkgdesc="Manager for INSTEAD interpreter."
arch=('i686' 'x86_64')
url="https://github.com/jhekasoft/insteadman3"
license=('MIT')
depends=('instead')
makedepends=('go')
source=("https://github.com/jhekasoft/insteadman3/archive/v$pkgver.tar.gz")
sha256sums=('d5b2d209b346155996cc83fb8def74f5dd5a574a082fc52a4c27c6ca2c951c40')

build() {
  cd "$srcdir/insteadman3-$pkgver"
  GOPATH=`pwd`/.. make
}

package() {
  cd "$srcdir/insteadman3-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
