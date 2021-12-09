# Maintainer: <user11681 at gmail dot com>
pkgname=circle
pkgver=build_144
pkgrel=1
pkgdesc='compiler for the programming language Circle'
arch=('any')
url='https://circle-lang.org'
license=('custom')
depends=('gcc>=10.2')
source=("https://www.circle-lang.org/linux/${pkgver}.tgz")
sha256sums=('7f167a1f7c34c2157db220407e3a1ed48be5f3809878c44f883cd0b2c9896894')

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

