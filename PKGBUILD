pkgname=json-stroller-git
pkgver=v1.0.b.r0.ga2ff89f
pkgrel=1
pkgdesc="A ncurse tool for viewing json formatted data"
arch=('i686' 'x86_64')
license=('GPL3')
depends=()
source=("$pkgname::git://github.com/isundil/jsonStroller.git")
md5sums=('SKIP')

pkgver() {
    cd $pkgname
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd $pkgname
    cmake -DCMAKE_BUILD_TYPE=Release
    make all test
}

package() {
    cd $pkgname
    make install
}

