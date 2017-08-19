# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Bernard Baeyens (berbae) <berbae52 at sfr dot fr>

pkgname=pan
pkgver=0.142
pkgrel=2
pkgdesc="A powerful Newsgroup Article reader"
arch=(i686 x86_64)
url="http://pan.rebelbase.com/"
license=(GPL2)
depends=(gtkspell gmime)
makedepends=(intltool itstool)
source=("http://pan.rebelbase.com/download/releases/$pkgver/source/$pkgname-$pkgver.tar.bz2")
sha256sums=('12d776e981a32123a18f02424173910ab3bf5856ead416ea33b83d927ab42f93')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --with-gnutls
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
