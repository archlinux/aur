# Maintainer: smlb <smlb at riseup dot net>

pkgname=libthinkpad
pkgver=2.4
pkgrel=3
pkgdesc="A general purpose userspace ThinkPad library"
arch=('i686' 'x86_64')
url="https://github.com/libthinkpad/libthinkpad"
license=('BSD')
depends=('libsystemd')
makedepends=('cmake')
source=("http://thinkpads.org/ftp/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('7f325a94be08685fc2501832888dffd6')

build () {
    cd "$srcdir/$pkgname-$pkgver"
    cmake . -DCMAKE_INSTALL_PREFIX=/usr
    make 
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR=$pkgdir install
}

