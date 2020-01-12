# Maintainer: David Donahue <david at donahue6 dot us>
pkgname=repocalc
pkgver=1.1.0
pkgrel=2
pkgdesc="An ncurses RPN calculator"
arch=('any')
url="https://github.com/drdonahue/repocalc"
license=('MIT')
depends=('ncurses' 'glibc')
makedepends=('gcc' 'pkgconf')
source=("https://github.com/drdonahue/repocalc/releases/download/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('165de057abd5250dff95ffecbd087980039cb26b437594dc9e64c9738cc74fec')

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
