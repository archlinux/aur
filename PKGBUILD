# Contributor: Auguste Pop <auguste [at] gmail [dot] com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=pachi
pkgver=11.00
_pkgcodename=retsugen
pkgrel=1
pkgdesc="A reasonably strong engine for the board game go" 
arch=('i686' 'x86_64')
url="http://pachi.or.cz/"
license=('GPL')
source=("https://github.com/pasky/pachi/archive/$pkgname-$pkgver-$_pkgcodename.tar.gz")
md5sums=('6924b14774c3daf30c6e2e105bee88e9')

build()
{
    cd $srcdir/$pkgname-$pkgname-$pkgver-$_pkgcodename
    make pachi-profiled
}

package()
{
    cd $srcdir/$pkgname-$pkgname-$pkgver-$_pkgcodename
    install -D -d $pkgdir/usr/bin
    make DESTDIR=$pkgdir PREFIX=/usr install
}
