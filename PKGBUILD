# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=gudhi
pkgver='3.0.0'
pkgrel=3
pkgdesc="Generic open source C++ library, with a Python interface, for Topological Data Analysis (TDA) and Higher Dimensional Geometry Understanding."
arch=(any)
url="https://github.com/GUDHI/gudhi-devel"
license=('GPLv3')
groups=()
depends=('eigen' 'cgal' 'boost')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("${url}/archive/tags/gudhi-release-${pkgver}.tar.gz")
sha256sums=('2ca0df8622583e280ee23227bfe7ad7afd58c568b8171c145ccccc8a1a694445')

build() {
    cd gudhi-devel-tags-gudhi-release-${pkgver}
    mkdir -p build
    cd build
    cmake ..
    make
}

package() {
    cd gudhi-devel-tags-gudhi-release-${pkgver}/build
    make DESTDIR=${pkgdir} install 
    cd python
    python setup.py install --root="$pkgdir/" --optimize=1
}

