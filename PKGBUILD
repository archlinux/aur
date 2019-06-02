# Maintainer: David Donahue <david at donahue6 dot us>
pkgname=repocalc
pkgver=1.0.2
pkgrel=1
pkgdesc="An ncurses RPN calculator"
arch=('any')
url="https://github.com/drdonahue/repocalc"
license=('MIT')
depends=('ncurses' 'glibc')
makedepends=('gcc' 'pkgconf')
source=("https://github.com/drdonahue/repocalc/archive/$pkgname-$pkgver.tar.gz")
sha256sums=('ae3f147a0c1d00f246b642397d2e2ac15390a5105b4e269326e3aa80bd6e646e')

build() {
    cd $srcdir/$pkgname-$pkgver
    make
}

package() {
    cd $srcdir/$pkgname-$pkgver
    echo $pkgdir
    make DESTDIR="$pkgdir" PREFIX="/usr" install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
