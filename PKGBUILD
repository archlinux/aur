# Maintainer: Auguste Pop <auguste [at] gmail [dot] com>

pkgname=popeye
pkgver=4.69
pkgrel=1
pkgdesc="A chess problem solving and testing software"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/popeye-chess/"
license=('GPL2')
source=("http://downloads.sourceforge.net/project/${pkgname}-chess/Popeye/${pkgver}/${pkgname}-${pkgver}-sources.zip")
md5sums=('507191b2d95f5937c112541b92f10c26')

build()
{
    cd "$srcdir/$pkgver"
    CFLAGS="$CFLAGS -march=native -mtune=native" make -f makefile.unx
}

package()
{
    cd "$srcdir/$pkgver"

    install -m 755 -D py "$pkgdir/usr/bin/py"
    install -d "$pkgdir/usr/share/doc/$pkgname"
    install -m 644 py-*.txt "$pkgdir/usr/share/doc/$pkgname"
}
