# Maintainer: Boris Timofeev <btimofeev@emunix.org>
pkgname=insteadman
pkgver=3.2.2
pkgrel=2
pkgdesc="Manager for INSTEAD interpreter."
arch=('i686' 'x86_64')
url="https://github.com/jhekasoft/insteadman"
license=('MIT')
depends=('instead')
makedepends=('go>=2:1.17')
source=("https://github.com/jhekasoft/insteadman/archive/v$pkgver.tar.gz")
sha256sums=('b021e1d9a9c8922a4a523981828001133ad5748ab4afc97dd2fa7b375fca6944')

build() {
  cd "$srcdir/insteadman-$pkgver"
  GOPATH=`pwd`/.. make
}

package() {
  cd "$srcdir/insteadman-$pkgver"
  GOPATH=`pwd`/.. make DESTDIR="$pkgdir" install
  GOPATH=`pwd`/.. go clean -modcache
}

# vim:set ts=2 sw=2 et:
