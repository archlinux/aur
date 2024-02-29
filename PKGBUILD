# Maintainer: Sateallia <mail at sateallia dot org>

pkgname=resistormaid
pkgver=2.0.1
pkgrel=2
pkgdesc="CLI resistor calculator"
arch=('x86_64')
url='https://sateallia.org/software/'
license=('MIT')

source=('https://sateallia.org/code/resistormaid/resistormaid_2_0_0.tar.gz'
	'https://sateallia.org/code/resistormaid/resistormaid_2_0_1.patch')

prepare() {
    patch < resistormaid_2_0_1.patch
}

build() {
	make
}

package() {
    install -D -m755 resistormaid ${pkgdir}/usr/bin/resistormaid
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
md5sums=('4296e292d9c723da5b316386e301be3e'
         '9482b16ce012e24f2b24a4e1d10775c5')
