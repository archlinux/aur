# Maintainer: Auguste Pop <auguste [at] gmail [dot] com>

pkgname=pachi-go
_pkgalias=pachi
pkgver=11.00
_pkgcodename=retsugen
pkgrel=1
pkgdesc="A reasonably strong engine built within a simple modular framework"
arch=('i686' 'x86_64')
url="http://pachi.or.cz/"
license=('GPL')
source=("https://github.com/pasky/pachi/archive/$_pkgalias-$pkgver-$_pkgcodename.tar.gz")
md5sums=('6924b14774c3daf30c6e2e105bee88e9')

build()
{
    cd $srcdir/$_pkgalias-$_pkgalias-$pkgver-$_pkgcodename
    make pachi-profiled
}

package()
{
    cd $srcdir/$_pkgalias-$_pkgalias-$pkgver-$_pkgcodename
    install -D -d $pkgdir/usr/bin
    make DESTDIR=$pkgdir PREFIX=/usr install
}
