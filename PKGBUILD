# Maintainer: Sateallia <mail at sateallia dot org>

pkgname=resistormaid
pkgver=2.1.0
pkgrel=1
pkgdesc="CLI resistor calculator"
arch=('x86_64')
url='https://coding.homdworks.org/sateallia/resistormaid'
license=('MIT')

source=("${pkgname}-${pkgver}.tar.gz::https://coding.homdworks.org/sateallia/resistormaid/archive/${pkgver}.tar.gz")

build() {
    cd "${pkgname}"
	gcc ${CFLAGS} resistormaid.c -o resistormaid ${LDFLAGS} -lm
}

package() {
    cd "${pkgname}"
    install -D -m755 resistormaid "${pkgdir}/usr/bin/resistormaid"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
sha256sums=('ba8ee207662ebba8efb650dc137e0cadc63974f38e2a767236f29d9ef6953f92')
