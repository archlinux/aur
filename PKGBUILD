# Maintainer: Abel GOMES <abel.gomes@etu.unistra.fr>

pkgname=wm
pkgver=2.0
pkgrel=2
pkgdesc="ASCII animation of tanks like sl but with war machines"
arch=('x86_64')
url="https://github.com/Bebel9445/wm"
license=('MIT')
depends=('ncurses')
source=("https://github.com/Bebel9445/wm/archive/v2.0.tar.gz")
sha256sums=('c0ec5e5a53f23657a7d307493d502fc8d19b625d1d3ca6940a8a9a61ddf79525')

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

