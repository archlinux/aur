# Maintainer: Florian Schweikert <kelvan@ist-total.org>
pkgname=pyotherside
pkgver=1.5.0
pkgrel=2
pkgdesc="Asynchronous Python 3 Bindings for Qt 5"
arch=('arm' 'armv7h' 'x86' 'x86_64')
url="http://thp.io/2011/pyotherside"
license=('ISC')
depends=(qt5-base python qt5-declarative qt5-svg)
makedepends=(qt5-base python qt5-declarative qt5-svg)
source=(http://thp.io/2011/$pkgname/$pkgname-$pkgver.tar.gz)
sha1sums=('ef99af3bf05a032b8c2b2908a97dff50a03fc822')

build() {
  cd $pkgname-$pkgver

  qmake
  make
}

package() {
  cd $pkgname-$pkgver

  make INSTALL_ROOT="$pkgdir/" install
}
