# Maintainer: Boris Timofeev <btimofeev@emunix.org>
pkgname=insteadman
pkgver=3.0.4
pkgrel=1
pkgdesc="Manager for INSTEAD interpreter."
arch=('i686' 'x86_64')
url="https://github.com/jhekasoft/insteadman3"
license=('MIT')
depends=('instead')
makedepends=('go')
source=("https://github.com/jhekasoft/insteadman3/archive/v$pkgver.tar.gz")
sha256sums=('3271277629f63bcfadebc72f6ade3d3091d371bcf49c15c2ad1f6ac1df9bf95d')

build() {
  cd "$srcdir/insteadman3-$pkgver"
  GOPATH=`pwd`/.. make
}

package() {
  cd "$srcdir/insteadman3-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
