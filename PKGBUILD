# Maintainer: <me at auoeke dot net>
pkgname=circle
pkgver=build_163
pkgrel=1
pkgdesc='a C++ compiler with many novel language features'
arch=('any')
url='https://circle-lang.org'
license=('custom')
depends=('gcc>=10.2')
source=("https://www.circle-lang.org/linux/${pkgver}.tgz")
sha256sums=('4b21e2a85038d2f1ddae3d3ff04f0aef448850dad9f0fc41771c17e6d6926df5')

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

