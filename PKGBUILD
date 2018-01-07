# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Bernard Baeyens (berbae) <berbae52 at sfr dot fr>

pkgname=pan
pkgver=0.144
pkgrel=1
pkgdesc="A powerful Newsgroup Article reader"
arch=(x86_64)
url="http://pan.rebelbase.com/"
license=(GPL2)
depends=(gtkspell3 gmime)
makedepends=(intltool itstool)
source=("http://pan.rebelbase.com/download/releases/$pkgver/source/$pkgname-$pkgver.tar.bz2")
sha256sums=('91fae377c1b01f173f21d89d9e503c9a59f902e25423b15d5db04bf4cbf10750')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --with-gnutls --with-gtk3
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
