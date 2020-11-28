pkgname=acado
pkgver=1.2.2
pkgrel=1
pkgdesc="algorithm collection for automatic control and dynamic optimization"
arch=('i686' 'x86_64')
url="https://acado.github.io/"
license=('LGPLv3')
makedepends=('gcc' 'libmpc' 'cmake' 'git' 'gnuplot' 'doxygen' 'graphviz')
depends=('libmpc' 'gnuplot' 'doxygen' 'graphviz')

_commit_id=b4e28f3131f79cadfd1a001e9fff061f361d3a0f
source=("git+https://github.com/acado/acado.git#commit=${_commit_id}")
sha256sums=('SKIP')

build() {
    cd $srcdir
    mkdir -p build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr ../acado
    make
}

package() {
    cd $srcdir/build
    make DESTDIR="$pkgdir/" install
}
