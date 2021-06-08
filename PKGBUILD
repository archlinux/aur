# Maintainer: <user11681 at gmail dot com>
pkgname=circle
pkgver=build_126
pkgrel=3
pkgdesc='Compiler for the Circle language'
arch=('any')
url='https://circle-lang.org'
license=('custom')
depends=('gcc>=5.0.0')
source=('https://www.circle-lang.org/linux/build_126.tgz')
sha256sums=('8e1c03b81474a1ae18945a436f5a7136d8242a0592f6ebe9875b35db9f657c02')

prepare() {
    chmod +x circle
}

check() {
    ./circle sanity.cxx
    ./sanity
}

package() {
    install -D circle "$pkgdir/usr/bin/circle"
    install -Dm 664 license.txt "$pkgdir/usr/share/licenses/${pkgname}/license.txt"
}

