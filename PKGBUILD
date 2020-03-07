# Maintainer: Taiki Sugawara <buzz.taiki@gmail.com>
pkgname=xcruiser
pkgver=0.30
pkgrel=1
pkgdesc="xcruiser aims to provide 3D VR-like interface to UN*X filesystem. It displays directories as galaxies, files as planets and symlinks as wormholes. You can fly through cyberspace created from these."
arch=('i686' 'x86_64')
url="http://xcruiser.sourceforge.net/"
license=('GPL')
depends=(libx11 libxaw)
makedepends=(imake)
source=(https://prdownloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('917b68dc06389bfcdde742f0798f61cdeaea2ae3c6567960c33f7634d4861ce5')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  xmkmf -a
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make install DESTDIR="$pkgdir/"
  make install.man DESTDIR="$pkgdir/"
}

# vim:set ts=2 sw=2 et:
