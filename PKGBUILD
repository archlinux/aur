# Maintainer: David Donahue <david at donahue6 dot us>
pkgname=repocalc
pkgver=1.0.1
pkgrel=2
pkgdesc="An ncurses RPN calculator"
arch=('any')
url="https://github.com/drdonahue/repocalc"
license=('MIT')
depends=('ncurses' 'glibc')
makedepends=('gcc' 'pkgconf')
source=("https://github.com/drdonahue/repocalc/archive/$pgkname-$pkgver.tar.gz")
sha256sums=('306845ebbb30e3da3559391bafa7d648a92ca397156883863537df04e45d9be3')

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
