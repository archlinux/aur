# Maintainer: Auguste Pop <auguste [at] gmail [dot] com>

pkgname=uncrustify
pkgver=0.61
pkgrel=1
pkgdesc="A source code beautifier"
arch=('i686' 'x86_64')
url="http://uncrustify.sourceforge.net/"
license=('GPL')
depends=('gcc-libs')
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('b6140106e74c64e831d0b1c4b6cf7727')

build()
{
    cd "$srcdir/$pkgname-$pkgver"
    ./configure --prefix=/usr
    make
}

package()
{
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR=$pkgdir install
}
