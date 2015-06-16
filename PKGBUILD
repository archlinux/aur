# Maintainer: Florian Schweikert <kelvan@ist-total.org>
pkgname=pyotherside
pkgver=1.4.0
pkgrel=1
pkgdesc="Asynchronous Python 3 Bindings for Qt 5"
arch=('arm' 'armv7h' 'x86' 'x86_64')
url="http://thp.io/2011/pyotherside"
license=('ISC')
depends=(qt5-base python qt5-declarative)
makedepends=(qt5-base python qt5-declarative)
source=(http://thp.io/2011/$pkgname/$pkgname-$pkgver.tar.gz)
sha1sums=('08d3399298acd3e6e7c1aa1c9e4604ef15538c3a')

build() {
  cd $pkgname-$pkgver

  qmake
  make
}

package() {
  cd $pkgname-$pkgver

  make INSTALL_ROOT="$pkgdir/" install
}
