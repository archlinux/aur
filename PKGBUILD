# Contributor: Lucas Hermann Negri <kkndrox@gmail.com>
# Maintainer: Benoit Favre <benoit.favre@gmail.com>
pkgname=cmph
pkgver=2.0.2
pkgrel=1
pkgdesc="C minimal perfect hashing library"
arch=('i686' 'x86_64')
url="http://cmph.sourceforge.net/"
license=('lgpl' 'mpl')
depends=('gcc')
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('51ec5329b47774d251a96eaaafdb409e')
options=(staticlibs)

build() {
    cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR=${pkgdir} install
    install -d "$pkgdir/usr/include"
    install -t "$pkgdir/usr/include" src/*structs.h src/*hash*.h
}

