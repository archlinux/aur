# Maintainer: Auguste Pop <auguste [at] gmail [dot] com>

pkgname=natch
pkgver=2.5Beta
pkgrel=1
pkgdesc="A software solving chess proof games"
arch=('i686' 'x86_64')
url="http://natch.free.fr/Natch.html"
license=('GPL2')
source=("http://natch.free.fr/Natch/Natch-$pkgver.tar.gz")
md5sums=('95065310b1d5ee2a9ebf85111c55399b')

build()
{
    cd "$srcdir/Natch-$pkgver"
    CFLAGS='-march=native -mtune=native'
    ./configure
    make
}

package()
{
    cd "$srcdir/Natch-$pkgver"
    install -m 755 -D src/Natch "$pkgdir/usr/bin/natch"
    install -d "$pkgdir/usr/share/doc/$pkgname"
    install -m 644 README* "$pkgdir/usr/share/doc/$pkgname"
}
