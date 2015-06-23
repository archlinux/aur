# Maintainer: masutu < masutu dot arch at gmail dot com>
# Contributor: Matias De la Puente <mfpuente.ar at gmail com>

pkgname=qantenna
pkgver=0.3.0
pkgrel=1
pkgdesc="A multiplatform antenna and radiation pattern analyzer"
arch=('i686' 'x86_64')
url="http://qantenna.sourceforge.net/"
license=('GPL2')
depends=('glu' 'necpp-git' 'qt5-base')
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.orig.tar.xz)
md5sums=('06b98e442afed37dbed7f9d645942942')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	qmake PREFIX=/usr qantenna.pro
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make INSTALL_ROOT="$pkgdir/" install
}

