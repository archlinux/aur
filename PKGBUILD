# Maintainer: smlb <smlb at riseup dot net>

pkgname=libthinkpad
pkgver=2.6
pkgrel=4
pkgdesc="A general purpose userspace ThinkPad library"
arch=('i686' 'x86_64')
url="https://github.com/libthinkpad/libthinkpad"
license=('BSD')
depends=('libsystemd' 'acpid')
makedepends=('cmake')
source=("http://thinkpads.org/ftp/$pkgname/$pkgname-$pkgver.tar.gz" "$pkgname.install")
md5sums=('66750d4ece8e12605e022acc134d352f'
'b44e3c7ddac879d57b45a709544df785')

install=$pkgname.install 

build () {
    cd "$srcdir/$pkgname-$pkgver"
    cmake . -DCMAKE_INSTALL_PREFIX=/usr
    make 
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR=$pkgdir install
}

