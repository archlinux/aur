# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=gudhi
pkgver='3.1.0'
pkgrel=1
pkgdesc="Geometry understanding in higher dimensions"
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
sha256sums=('d8e4c28f9f113205eedc7cbe5b75b104431a0a65f9e2e4b30e9b6ed4eea21e64')

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

