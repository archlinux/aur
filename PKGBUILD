# Maintainer: Auguste Pop <auguste [at] gmail [dot] com>

pkgname=fairymax
pkgver=4.8R
pkgrel=1
pkgdesc="An engine playing chess variants"
arch=('i686' 'x86_64')
url=('http://home.hccnet.nl/h.g.muller/CVfairy.html')
license=('custom')
backup=("usr/share/$pkgname/fmax.ini" "usr/share/$pkgname/qmax.ini")
source=(http://home.hccnet.nl/h.g.muller/$pkgname.tar.gz)
md5sums=('8465d0286946d88ca222872565869887')

build()
{
    cd "$srcdir/Fairy-Max"
    sed -i "s:/usr/share/games/fairymax:/usr/share/$pkgname:;s:/usr/games:/usr/bin:" Makefile
    make
}

package()
{
    cd "$srcdir/Fairy-Max"
    install -d "$pkgdir/usr/bin"
    make DESTDIR="$pkgdir" install
    install -m 644 -D copyright "$pkgdir/usr/share/licenses/$pkgname/COPYRIGHT"
}
