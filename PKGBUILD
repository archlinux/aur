# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=nyacc  
pkgver=0.76.5
pkgrel=1
pkgdesc="Not Yet Another Compiler Compiler"
url="http://www.nongnu.org/nyacc"
arch=('any')
license=('GPL' 'LGPL' 'GFDL')
depends=('guile')
makedepends=()
source=(https://download.savannah.gnu.org/releases/nyacc/$pkgname-$pkgver.tar.gz)
sha256sums=('8085fa68829eb49215786eb3a1f5b7e06944a10d3bedc78c9edf6a4dfbac78a2')

prepare() {
  cd $pkgname-$pkgver/module
  sed 's+DIR=+DIR=$(DESTDIR)+' Makefile.nyacc > Makefile
}

package() {
  cd $pkgname-$pkgver/module
  make DESTDIR=$pkgdir install
}
