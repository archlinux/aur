# $Id: PKGBUILD 131827 2015-04-21 09:15:16Z arojas $
# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=brial
pkgver=0.8.4.3
pkgrel=1
pkgdesc="Library for polynomials over boolean rings"
arch=(i686 x86_64)
url="https://github.com/BRiAl/BRiAl"
license=(GPL)
depends=(python2 m4ri)
#makedepends=(boost)
conflicts=(polybori)
replaces=(polybori)
source=("https://github.com/BRiAl/BRiAl/releases/download/$pkgver/$pkgname-$pkgver.tar.bz2")
md5sums=('66275eea0654cb1eb6438a6262140885')

build() {
  cd $pkgname-$pkgver 

  export PYTHON=python2
  ./configure --prefix=/usr --enable-shared
  make
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir" install
}

