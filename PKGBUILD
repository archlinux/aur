# Maintainer: <user11681 at gmail dot com>
pkgname=circle
pkgver=build_127
pkgrel=1
pkgdesc='Compiler for the Circle language'
arch=('any')
url='https://circle-lang.org'
license=('custom')
depends=('gcc>=9.0.0' 'binutils')
source=("https://www.circle-lang.org/linux/${pkgver}.tgz")
sha256sums=('382e8711838e388ecc10d1be0bd08955f00fe5fcaff334cced3151cc9dda4c98')

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

