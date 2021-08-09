# Maintainer: <user11681 at gmail dot com>
pkgname=circle
pkgver=build_130
pkgrel=1
pkgdesc='Compiler for the Circle language'
arch=('any')
url='https://circle-lang.org'
license=('custom')
depends=('gcc>=9.0.0' 'binutils')
source=("https://www.circle-lang.org/linux/${pkgver}.tgz")
sha256sums=('f92ab99e2d0f25f74972269c2f19712a6397dccd39b3c2ee5fea0f10022bf71a')

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

