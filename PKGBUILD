# Maintainer: <user11681 at gmail dot com>
pkgname=circle
pkgver=build_138
pkgrel=1
pkgdesc='compiler for the programming language Circle'
arch=('any')
url='https://circle-lang.org'
license=('custom')
depends=('gcc>=9.0.0' 'binutils')
source=("https://www.circle-lang.org/linux/${pkgver}.tgz")
sha256sums=('f7635bc39e978aadd983bde1929077eb6975deaf7bca8046b5df454c3d22a1b1')

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

