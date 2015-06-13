# Maintainer: Kyle Keen
# Contributor: simongmzlj
pkgname=greed
pkgver=3.11
pkgrel=1
pkgdesc='The strategy game of Greed.'
arch=('i686' 'x86_64')
url='http://www.catb.org/~esr/greed/'
license=('GPL')
depends=('ncurses')
source=("http://www.catb.org/~esr/greed/$pkgname-$pkgver.tar.gz")
md5sums=('81e9e57ea26fad2bcd3e3fcdd0b7a8f6')

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
