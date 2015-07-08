# Maintainer: OmeGa <omega [U+0040] mailoo [.] org>
# Contributor: Lukas Miczka <lukascpu@gmail.com>

pkgname=gmpc-lyrics
pkgver=11.8.16
pkgrel=2
pkgdesc="This plugin fetches lyrics from the web from two sites."
arch=('i686' 'x86_64')
url="http://gmpc.wikia.com/wiki/GMPC_PLUGIN_LYRICS"
license=('GPL')
depends=('gmpc>=11.8.16')
makedepends=('intltool')
options=('!libtool')
source=(http://download.sarine.nl/Programs/gmpc/$pkgver/$pkgname-$pkgver.tar.gz)
sha1sums=('d121251e820a173d29793461ba04d1725581c395')

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
