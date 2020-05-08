# Maintainer: Nick Skelsey <nskelsey+zz@gmail.com>
pkgname=auralcap
pkgver=0.2.1
pkgrel=1
pkgdesc="Monitor files and make noise"
arch=('x86_64')
url="https://github.com/NSkelsey/monopticon/tree/master/contrib/expirements/auralcap"
license=('GPL')
depends=("csound" "corrade" "libevent")
makedepends=("cmake" "csound" "corrade" "libevent" "bash" "git")
source=("git+https://github.com/nskelsey/monopticon/")
md5sums=("SKIP")

build() {
    cd "$srcdir/monopticon/contrib/expirements/auralcap"
    mkdir -p "$srcdir/monopticon/contrib/expirements/auralcap/build"
    cmake -S . -B build
    cmake --build build
}

package() {
    cd "$srcdir/monopticon/contrib/expirements/auralcap/build"
    make DESTDIR="$pkgdir/" install
}
