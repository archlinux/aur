pkgname=bincalc
pkgver=3
pkgrel=1
pkgdesc='Command line calculator for bit fiddling (showing bits, showing as floats, etc.)'
url='https://github.com/sandsmark/bincalc'
arch=('x86_64' 'i686')
license=('GPL2')
makedepends=(gcc)
depends=(gmp)
source=("https://github.com/sandsmark/bincalc/archive/${pkgver}.tar.gz")
sha256sums=('e85a7434183c9c996c2b6442a8322fd6f2288cf2d927b996652e2565a916b61e')

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
