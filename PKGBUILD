# Maintainer: <user11681 at gmail dot com>
pkgname=circle
pkgver=build_129
pkgrel=1
pkgdesc='Compiler for the Circle language'
arch=('any')
url='https://circle-lang.org'
license=('custom')
depends=('gcc>=9.0.0' 'binutils')
source=("https://www.circle-lang.org/linux/${pkgver}.tgz")
sha256sums=('5544396eb5ff04b6da6ce783deaf697bc4f423ce9b34a77c08af524e2cc7df77')

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

