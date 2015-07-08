# Maintainer: OmeGa <omega [U+0040] mailoo [.] org>
# Contributor: Lukas Miczka <lukascpu@gmail.com>

pkgname=gmpc-wikipedia
pkgver=11.8.16
pkgrel=2
pkgdesc="The Wikipedia plugin shows information about the current artist."
arch=('i686' 'x86_64')
url="http://gmpc.wikia.com/wiki/GMPC_PLUGIN_WIKIPEDIA"
license=('GPL')
depends=('gmpc>=11.8.16' 'libwebkit')
makedepends=('intltool')
options=('!libtool')
source=(http://download.sarine.nl/Programs/gmpc/$pkgver/$pkgname-$pkgver.tar.gz)
sha1sums=('c860e7c5614362f8cd8bf3cff820032cb1a41691')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
