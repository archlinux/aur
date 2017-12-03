# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Bernard Baeyens (berbae) <berbae52 at sfr dot fr>

pkgname=pan
pkgver=0.143
pkgrel=1
pkgdesc="A powerful Newsgroup Article reader"
arch=(x86_64)
url="http://pan.rebelbase.com/"
license=(GPL2)
depends=(gtkspell3 gmime)
makedepends=(intltool itstool)
source=("http://pan.rebelbase.com/download/releases/$pkgver/source/$pkgname-$pkgver.tar.bz2")
sha256sums=('3d3b7ff776d887578c1f7662c5d4c4097a8a00380a89f6b148ff2775f159a902')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --with-gnutls --with-gtk3
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
