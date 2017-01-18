# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Bernard Baeyens (berbae) <berbae52 at sfr dot fr>

pkgname=pan
pkgver=0.141
pkgrel=2
pkgdesc="A powerful Newsgroup Article reader"
arch=(i686 x86_64)
url="http://pan.rebelbase.com/"
license=(GPL2)
depends=(gtkspell gmime)
makedepends=(intltool)
source=("http://pan.rebelbase.com/download/releases/$pkgver/source/$pkgname-$pkgver.tar.bz2")
md5sums=('306003e506d8e7d16b6caccc9a160ab3')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --with-gnutls
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
