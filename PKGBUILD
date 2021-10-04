# Maintainer: <user11681 at gmail dot com>
pkgname=circle
pkgver=build_137
pkgrel=1
pkgdesc='compiler for the programming language Circle'
arch=('any')
url='https://circle-lang.org'
license=('custom')
depends=('gcc>=9.0.0' 'binutils')
source=("https://www.circle-lang.org/linux/${pkgver}.tgz")
sha256sums=('0c2912fd43f5191e8f82d686a680a6c43d68551549c7c2012dbd5ad56d0f726a')

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

