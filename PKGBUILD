# Maintainer: OmeGa <omega [U+0040] mailoo [.] org>

pkgname=gmpc-albumview
pkgver=11.8.16
pkgrel=2
pkgdesc="This plugin shows your music collection in albums."
arch=('i686' 'x86_64')
url="http://gmpc.wikia.com/wiki/GMPC_PLUGIN_ALBUMVIEW"
license=('GPL')
depends=('gmpc>=11.8.16')
makedepends=('intltool')
options=('!libtool')
source=(http://download.sarine.nl/Programs/gmpc/$pkgver/$pkgname-$pkgver.tar.gz)
sha1sums=('62240fd85458b34ab408b545a26d5bf95c18bbae')

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
