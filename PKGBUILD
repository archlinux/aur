pkgname=bincalc
pkgver=1
pkgrel=1
pkgdesc='A simple command line calculator for bit fiddling (e. g for reverse engineering)'
url='https://github.com/sandsmark/bincalc'
arch=('x86_64' 'i686')
license=('GPL2')
makedepends=(gcc)
depends=(gmp)
source=("https://github.com/sandsmark/bincalc/archive/${pkgver}.tar.gz")
sha256sums=('eae53cb18818f4d875686c653c6394af06a8029968661314100067589e277128')

build() {
    cd bincalc-${pkgver}

    # gnu make and/or gcc are broken
    LDFLAGS+=,--no-as-needed

    make
}

package() {
    cd bincalc-${pkgver}
    install -D -m755 bincalc -t "${pkgdir}/usr/bin"
}
