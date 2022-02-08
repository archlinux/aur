# Maintainer: <me at auoeke dot net>
pkgname=circle
pkgver=build_155
pkgrel=1
pkgdesc='compiler for the programming language Circle'
arch=('any')
url='https://circle-lang.org'
license=('custom')
depends=('gcc>=10.2')
source=("https://www.circle-lang.org/linux/${pkgver}.tgz")
sha256sums=('c334925e2e66d62c08197b7c93e319167d896b203f7cd9793f36f83cf72de3d8')

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

