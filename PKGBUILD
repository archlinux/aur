# Maintainer: <me at auoeke dot net>
pkgname=circle
pkgver=build_162
pkgrel=1
pkgdesc='a C++ compiler with many novel language features'
arch=('any')
url='https://circle-lang.org'
license=('custom')
depends=('gcc>=10.2')
source=("https://www.circle-lang.org/linux/${pkgver}.tgz")
sha256sums=('02b93ddb69ca488c706156d73f782e70811017c516c59dec072fd7f7f1588e00')

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

