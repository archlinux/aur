# Maintainer: Timur Kiyivinski <timur@linux.com>

pkgname=cpuminer-xzc-git
pkgver=4.8212d77
pkgrel=1
pkgdesc='CPUMiner for ZCOIN (XZC)'
arch=('any')
url='https://github.com/ocminer/cpuminer-xzc'
license=('GPL2')
depends=('libcurl-gnutls' 'openssl' 'zlib')
source=("$pkgname::git+https://github.com/ocminer/cpuminer-xzc.git")
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
    cd "$pkgname"
    ./build.sh
    make
}

package() {
    cd "$pkgname"
    make DESTDIR="$pkgdir/" install
}
