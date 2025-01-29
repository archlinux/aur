# Maintainer: Ravi Kumar Kairi <kumarkairiravi@gmail.com>
# Contributor: Dilawar Singh <dilawar.s.rajput@gmail.com>

pkgname=smoldyn
pkgver=2.74
pkgrel=1
pkgdesc="Particle-based biochemical simulator for modeling molecular diffusion, surface interactions, and chemical reactions."
arch=('i686' 'x86_64')
url="http://www.smoldyn.org"
license=('GPL-2.0-only')
depends=('libtiff' 'freeglut' 'glu' 'libxmu')
makedepends=('mesa' 'libtiff' 'freeglut' 'glu' 'libxmu' 'cmake' 'python-flaky')
source=("http://www.smoldyn.org/${pkgname}-$pkgver.tgz")
sha256sums=('1abae836ac515092be14e2058af58a25981d7872c3a002fbff67bde0f64fa28a')

prepare() {
    cd "$pkgname-$pkgver"
}

build() {
    cd "$pkgname-$pkgver"
    cmake -DCMAKE_INSTALL_PREFIX=/usr .
    make
}

check() {
    cd "$pkgname-$pkgver"
    ctest --output-on-failure
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
