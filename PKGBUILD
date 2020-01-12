# Maintainer: David Donahue <david at donahue6 dot us>
pkgname=repocalc
pkgver=1.1.0
pkgrel=1
pkgdesc="An ncurses RPN calculator"
arch=('any')
url="https://github.com/drdonahue/repocalc"
license=('MIT')
depends=('ncurses' 'glibc')
makedepends=('gcc' 'pkgconf')
source=("https://github.com/drdonahue/repocalc/releases/download/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('a095e12af0222bb0aca0f42d1d06b8ca92a46348a491c0dbf3d8952501795d97')

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
