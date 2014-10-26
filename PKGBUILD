# Maintainer: Anton Leontiev <bunder /at/ t-25.ru>
# Contributor: Neven Sajko <nsajko at gmail dot com>
pkgname=gaussianbeam
pkgver=0.4
pkgrel=3
arch=('i686' 'x86_64')
pkgdesc="Gaussian optics simulator"
url="http://gaussianbeam.sourceforge.net/"
license=('GPL')
depends=('qt4>=4.4')
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname/GaussianBeam-$pkgver/GaussianBeam-$pkgver.tar.bz2)
md5sums=('d79f743f692dce767fe873ef63f5555a')

build() {
	cd GaussianBeam-$pkgver
	qmake-qt4
	make
}

package() {
	cd GaussianBeam-$pkgver
	install -D -m755 GaussianBeam "$pkgdir/usr/bin/$pkgname"
}
