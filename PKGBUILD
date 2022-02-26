# Maintainer: <me at auoeke dot net>
pkgname=circle
pkgver=build_161
pkgrel=1
pkgdesc='a C++ compiler with many novel language features'
arch=('any')
url='https://circle-lang.org'
license=('custom')
depends=('gcc>=10.2')
source=("https://www.circle-lang.org/linux/${pkgver}.tgz")
sha256sums=('7ac55b7766845ec602691fa0e873182d697a0253ce3afbdac72885cf0a5cf454')

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

