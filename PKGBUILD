# Maintainer: Boris Timofeev <btimofeev@emunix.org>
pkgname=insteadman
pkgver=3.0.5
pkgrel=1
pkgdesc="Manager for INSTEAD interpreter."
arch=('i686' 'x86_64')
url="https://github.com/jhekasoft/insteadman3"
license=('MIT')
depends=('instead')
makedepends=('go')
source=("https://github.com/jhekasoft/insteadman3/archive/v$pkgver.tar.gz")
sha256sums=('2c7693b8a6304c1ec5d387f53513c7811495300c7a09f076ab55d66fa1726d07')

build() {
  cd "$srcdir/insteadman3-$pkgver"
  GOPATH=`pwd`/.. make
}

package() {
  cd "$srcdir/insteadman3-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
