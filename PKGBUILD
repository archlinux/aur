pkgname=bincalc
pkgver=5
pkgrel=1
pkgdesc='Command line calculator for bit fiddling (showing bits, showing as floats, etc.)'
url='https://github.com/sandsmark/bincalc'
arch=('x86_64' 'i686')
license=('GPL2')
makedepends=(gcc)
depends=(gmp)
source=("https://github.com/sandsmark/bincalc/archive/${pkgver}.tar.gz")
sha256sums=('dc3a11c19461d8313067dbbcca593cb85a92004500549a36ee3e4788b0d511b6')

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
