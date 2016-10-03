pkgname=sundials
pkgver=2.7.0
pkgrel=1
pkgdesc="Suite of nonlinear differential/algebraic equation solvers"
arch=('i686' 'x86_64')
url="https://computation.llnl.gov/casc/sundials/main.html"
license=('BSD')
depends=('gcc-libs')
makedepends=('cmake')
source=("http://computation.llnl.gov/projects/sundials/download/$pkgname-$pkgver.tar.gz")
sha256sums=('d39fcac7175d701398e4eb209f7e92a5b30a78358d4a0c0fcc23db23c11ba104')

build() {
	mkdir -p build && pushd build
	cmake -DCMAKE_INSTALL_PREFIX=/usr -DEXAMPLES_ENABLE=OFF ../$pkgname-$pkgver
	make
	popd
}

package() {
	cd build
	make DESTDIR="$pkgdir/" install
}

