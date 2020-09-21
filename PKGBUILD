pkgname=bincalc
pkgver=4
pkgrel=1
pkgdesc='Command line calculator for bit fiddling (showing bits, showing as floats, etc.)'
url='https://github.com/sandsmark/bincalc'
arch=('x86_64' 'i686')
license=('GPL2')
makedepends=(gcc)
depends=(gmp)
source=("https://github.com/sandsmark/bincalc/archive/${pkgver}.tar.gz")
sha256sums=('cf3ddb4ba420475dc95587b5b3c729159b1a7a6d2f8cbe41b9dc09d921f64876')

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
