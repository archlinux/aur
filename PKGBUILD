# Maintainer: Kyle Keen
# Contributor: simongmzlj
pkgname=greed
pkgver=4.2
pkgrel=1
pkgdesc='The strategy game of Greed.'
arch=('i686' 'x86_64')
url='http://www.catb.org/~esr/greed/'
license=('GPL')
depends=('ncurses')
source=("http://www.catb.org/~esr/greed/$pkgname-$pkgver.tar.gz")
md5sums=('5a31b34f53c8455f3a90ff1c1dee35e3')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make #CFLAGS="${CFLAGS}"
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    # no DESTDIR support, install by hand
    touch greed.hs
    install -Dm755 greed    "$pkgdir/usr/bin/greed"
    install -Dm766 greed.hs "$pkgdir/usr/games/lib/greed.hs"
    install -Dm644 greed.6  "$pkgdir/usr/share/man/man6/greed.6"
}
