# Maintainer: ubone <vns at $thisdistro dot net>
pkgname=sselp
pkgver=0.2
pkgrel=1
pkgdesc="Simple X selection printer. Prints the X selection to stdout."
arch=('i686' 'x86_64')
url="http://tools.suckless.org/x/sselp"
license=('MIT')
depends=('libx11')
source=(http://dl.suckless.org/tools/sselp-$pkgver.tar.gz)
md5sums=('b74d6558790d8df897db40bca90bc0f6')

build() {
        cd "$pkgname-$pkgver"
        make
}

package() {
        cd "$pkgname-$pkgver"
        make PREFIX=/usr DESTDIR="$pkgdir/" install
        install -m644 -D LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
        install -m644 -D README $pkgdir/usr/share/doc/$pkgname/README
}