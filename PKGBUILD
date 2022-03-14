# Maintainer: <me at auoeke dot net>
pkgname=circle
pkgver=build_162
pkgrel=2
pkgdesc='a C++ compiler with many novel language features'
arch=('any')
url='https://circle-lang.org'
license=('custom')
depends=('gcc>=10.2')
source=("https://www.circle-lang.org/linux/${pkgver}.tgz")
sha256sums=('d9e7ba7a60d6aa211fc502cb2368ac5c8e143764b026502a4986dca4118008ac')

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

