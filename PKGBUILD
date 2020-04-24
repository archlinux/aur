# Maintainer: Kyle Manna <kyle [at] kylemanna [dot] com>

pkgname=dropwatch
pkgver=1.5.3
pkgrel=1
pkgdesc='Project to detect packet drops in Linux kernel'
arch=('x86_64')
url='https://github.com/nhorman/dropwatch'
license=('GPL2')
source=("https://github.com/nhorman/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('b748b66a816c1f94531446c0451da5461a4a31b0949244bb867d741c6ac0148b')

prepare() {
    cd "$srcdir/$_pkgname"
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    ./autogen.sh
    ./configure --prefix=/usr
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
}
