# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Bernard Baeyens (berbae) <berbae52 at sfr dot fr>

pkgname=pan
pkgver=0.149
pkgrel=1
pkgdesc='A powerful Newsgroup Article reader'
arch=(x86_64)
url='http://pan.rebelbase.com/'
license=(GPL2)
depends=(gtkspell3 gmime3)
makedepends=(itstool)
source=(https://pan.rebelbase.com/download/releases/$pkgver/source/pan-$pkgver.tar.gz)
sha256sums=('2445252125bc56d022dda1236adf80ae85274b41e5002c5667b0e032725b32b7')

build() {
  cd pan-$pkgver
  ./configure --prefix=/usr --with-gnutls --with-gtk3 --with-gtkspell
  make
}

package() {
  cd pan-$pkgver
  make DESTDIR="$pkgdir" install
}
