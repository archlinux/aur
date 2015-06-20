# Maintainer: banbanchs <memory.silentvoyage@gmail.com>

pkgname=libcstl
pkgver=2.3.0
pkgrel=1
pkgdesc="A common data structure and used algorithms C library"
arch=('i686' 'x86_64')
url="https://github.com/activesys/libcstl"
license=('LGPL')
depends=('glibc')
options=(!libtool)
source=(http://libcstl.org/downloads/$pkgname-$pkgver.tar.gz)
noextract=()
md5sums=('a509a7157bf763187d358376d8cf8e49')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    ./configure --prefix=/usr
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}

