pkgname=hashrat-git
pkgver=1.15.r0.g0b3c057
pkgrel=1
pkgdesc="Hashing tool. Includes recursive file hashing and other features. Git version."
arch=('any')
provides=('hashrat')
conflicts=('hashrat')
url="https://github.com/ColumPaget/Hashrat"
license=('GPL')
depends=()
source=(git+https://github.com/ColumPaget/Hashrat)
sha256sums=('SKIP')

pkgver() {
    cd Hashrat/
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/Hashrat"
    ./configure --enable-xattr --prefix "$pkgdir/usr"
    make
}

package() {
    mkdir -p "$pkgdir/usr"
    cd "$srcdir/Hashrat"
    make install
}
