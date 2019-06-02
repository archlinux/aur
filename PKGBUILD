# Maintainer: David Donahue <david at donahue6 dot us>
pkgname=repocalc
pkgver=1.0.1
pkgrel=4
pkgdesc="An ncurses RPN calculator"
arch=('any')
url="https://github.com/drdonahue/repocalc"
license=('MIT')
depends=('ncurses' 'glibc')
makedepends=('gcc' 'pkgconf')
source=("https://github.com/drdonahue/repocalc/archive/$pkgname-$pkgver.tar.gz")
sha256sums=('8cc985f5005f5a45aa4dbc5f7f39da419256c0f7ae86b6cf16bb5f6e4d001fcf')

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
