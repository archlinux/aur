# Maintainer: OmeGa <omega [U+0040] mailoo [.] org>
# Contributor: Claudio Kozický <claudiokozicky@gmail.com>

pkgname=gmpc-tagedit
pkgver=11.8.16
pkgrel=2
pkgdesc="Add to GMPC an editor for song tags."
arch=('i686' 'x86_64')
url="http://gmpc.wikia.com/wiki/GMPC_PLUGIN_TAGEDIT"
license=('GPL2')
depends=('gmpc>=11.8.16' 'taglib')
makedepends=('intltool' 'gob2')
options=('!libtool')
source=(http://download.sarine.nl/Programs/gmpc/$pkgver/$pkgname-$pkgver.tar.gz)
sha1sums=('a704e2ce6ab5b0faee6efdc892dc946ba077fa61')

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
