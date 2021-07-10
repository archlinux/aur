# Maintainer: <user11681 at gmail dot com>
pkgname=circle
pkgver=build_128
pkgrel=1
pkgdesc='Compiler for the Circle language'
arch=('any')
url='https://circle-lang.org'
license=('custom')
depends=('gcc>=9.0.0' 'binutils')
source=("https://www.circle-lang.org/linux/${pkgver}.tgz")
sha256sums=('afdd7cf7314bf7b3cde2b1fe6baa589076fb4585729151f5fb90f4041b70402c')

prepare() {
    chmod +x circle
}

check() {
    ./circle sanity.cxx
    ./sanity
}

package() {
    install -D circle "${pkgdir}/usr/bin/circle"
    install -Dm 664 license.txt "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
}


