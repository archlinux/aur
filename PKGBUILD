#Maintainer: Sam Bazley <sambazley@fastmail.com>

module=constwidth

pkgname=blockbar-${module}-git
pkgver=20191017024640
pkgrel=1
pkgdesc="Module for blockbar that prevents the block's width from changing"
arch=("i686" "x86_64")
url="https://gitlab.com/sambazley/blockbar-${module}"
license=("ZLIB")
makedepends=()
depends=("blockbar")
source=("git+https://gitlab.com/sambazley/blockbar-${module}.git")
md5sums=("SKIP")

pkgver() {
    cd blockbar-${module}
    git show -s --format=%ci HEAD | cut -d' ' -f1-2 | sed -r 's/[^0-9]//g'
}

build() {
    cd "${srcdir}/blockbar-${module}"
    make
}

package() {
    cd "${srcdir}/blockbar-${module}"
    make PREFIX="$pkgdir/usr" install
}
