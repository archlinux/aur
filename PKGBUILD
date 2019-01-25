# Maintainer: desbma
pkgname=apetag
pkgver=1.12
pkgrel=1
pkgdesc='A command line APE 2.0 tagger'
arch=('i686' 'x86_64')
url='http://robert.muth.org/Apetag/'
license=('GPL3')
depends=('gcc-libs')
source=("http://robert.muth.org/Apetag/${pkgname}.${pkgver}.tar.gz"
        'Makefile.patch')
sha512sums=('615c495721c6d46e6ce4546ede218efaac1f3fda91dcd9b8da2b8f7c79cc0f5fbee7dd5bc433c0b125973a816980abb8677f16d4000e5e71699524baddd16887'
            'SKIP')

prepare() {
    cd "Apetag"
    patch -i "${srcdir}/Makefile.patch" Makefile
}

build() {
    cd "Apetag"
    make
}

package() {
    cd "Apetag"
    install -Dm 755 -t "${pkgdir}/usr/bin" apetag
}
