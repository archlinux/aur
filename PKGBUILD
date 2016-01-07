# Maintainer: Paulo Castro <p.oliveira.castro@gmail.com>
pkgname=nest
pkgver=2.10.0
pkgrel=1
pkgdesc="Simulator for spiking neural network models"
arch=('x86_64')
url="www.nest-simulator.org/"
license=('GPL')
depends=('gsl' 'libtool' 'python')
optdepends=('ipython' 'python-numpy' 'python-scipy' 'python-matplotlib')
source=("https://github.com/nest/nest-simulator/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
md5sums=('e97371d8b802818c4a7de35276470c0c')
build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

check() {
	cd "$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
