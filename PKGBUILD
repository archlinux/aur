# Maintainer: <me at auoeke dot net>
pkgname=circle
pkgver=build_147
pkgrel=1
pkgdesc='compiler for the programming language Circle'
arch=('any')
url='https://circle-lang.org'
license=('custom')
depends=('gcc>=10.2')
source=("https://www.circle-lang.org/linux/${pkgver}.tgz")
sha256sums=('c6b52e8a32a9a85ab60661436a15a6cde14ad1a64b6899b19453cc8908ef3410')

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

