# Maintainer: Ankit R Gadiya <arch@argp.in>

pkgname='skroll'
pkgver=0.6
pkgrel=2
pkgdesc="text scroller"
url="http://git.2f30.org/skroll"
license=('WTFPL')
source=("https://dl.2f30.org/releases/${pkgname}-${pkgver}.tar.gz")
sha512sums=('71decfb2fa2bf746a7e7c3d7b054f04d132ff822eb61de8900f650724b35e9461610743cb86e7fbaa58110f33cc077c1c333e1dc32d01a08cf34057075ddd0ad')
arch=('x86_64')

build() {
    cd "${pkgname}-${pkgver}"
    make
}

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" PREFIX="/usr" install

    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
