# SDR++ headers for building modules
# Maintainer: cropinghigh <joinmark60@gmail.com>
# Author: Ryzerth
pkgname=sdrpp-headers-git
pkgver=r1365.a9f882e
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="SDR++ headers for building out-of-tree modules"
license=('GPL3')
depends=('sdrpp-git')
makedepends=('git')
provides=('sdrpp-headers')
conflicts=('sdrpp-headers')
source=("git+https://github.com/AlexandreRouma/SDRPlusPlus")
url="https://github.com/AlexandreRouma/SDRPlusPlus"
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/SDRPlusPlus"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/SDRPlusPlus/core/src"
    mkdir -p "$pkgdir/usr/include/sdrpp_core"
    find . -regex ".*\.\(h\|hpp\)" -exec cp --parents \{\} "$pkgdir/usr/include/sdrpp_core" \;
}
