# Maintainer: smlb <smlb at riseup dot net>

pkgname=libthinkpad
pkgver=2.3
pkgrel=2
pkgdesc="A general purpose userspace ThinkPad library"
arch=('i686' 'x86_64')
url="https://github.com/libthinkpad/libthinkpad"
license=('BSD-2')
depends=('systemd')
makedepends=('cmake')
source=("http://thinkpads.org/ftp/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('da6791c1880e73a43879023c1d7770a3')

build () {
    cd "$srcdir/$pkgname-$pkgver"
    cmake . -DCMAKE_INSTALL_PREFIX=/usr
    make 
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR=$pkgdir install
}

