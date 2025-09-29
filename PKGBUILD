# Maintainer: Abel GOMES <abel.gomes@etu.unistra.fr>

pkgname=wm
pkgver=2.2
pkgrel=1
pkgdesc="ASCII animation of tanks like sl but with war machines"
arch=('x86_64')
url="https://github.com/Bebel9445/wm"
license=('MIT')
depends=('ncurses')
source=("https://github.com/Bebel9445/wm/archive/v2.2.tar.gz")
sha256sums=('6d9ed58e8989a32f8cb7c35562f77f843ef46f64533453576cf2853bd20cd417')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 build/wm "$pkgdir/usr/bin/wm"
    install -Dm644 wm.1 "$pkgdir/usr/share/man/man1/wm.1"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README"
}