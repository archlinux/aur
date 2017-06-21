# Maintainer: Dan Beste <dan.ray.beste@gmail.com>

# TODO: manpages?

pkgname='libcs50'
pkgver=8.0.3
pkgrel=1
pkgdesc="Harvard's cs50 C library"
arch=('i686' 'x86_64')
url='https://cs50.harvard.edu/'
license=('unknown')
groups=('cs50')
conflicts=('libcs50')
provides=('libcs50')
source=("https://github.com/cs50/libcs50/archive/v${pkgver}.tar.gz")
sha256sums=('3559225ddc6b4619572c3672e4ac68cf4c5757917a7b92f20e1c48b1b80565e5')

build() {
    cd "${pkgname}-${pkgver}"

	make build
}

package() {
    cd "${pkgname}-${pkgver}"

    install -d -m 755 "${pkgdir}/usr/"
    cp -rp build/* "${pkgdir}/usr/"
}
