pkgname='polecat'
pkgver=0.1.9
pkgrel=1
pkgdesc='simple wine version manager'
arch=('i686' 'x86_64')
url='https://github.com/Jan200101/polecat'
license=('MIT')
depends=('wine')
makedepends=('curl' 'json-c' 'libarchive' 'cmake' 'gcc' 'git')
provides=('polecat')
conflicts=('polecat')
source=('git+https://github.com/Jan200101/polecat.git#tag=0.1.9')
sha512sums=('SKIP')

build() {
    mkdir -p build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr ../polecat
    make DESTDIR=.
}

package() {
    make -C build DESTDIR="$pkgdir" install
}
