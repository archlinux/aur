# Maintainer: Abel GOMES <abel.gomes@etu.unistra.fr>

pkgname=wm
pkgver=2.3
pkgrel=1
pkgdesc="ASCII animation of tanks like sl but with war machines"
arch=('x86_64')
url="https://github.com/Bebel9445/wm"
license=('MIT')
depends=('ncurses')
source=("https://github.com/Bebel9445/wm/archive/v2.3.tar.gz")
sha256sums=('4faad1bf4ec910ddf7e8e7678535cc0c1592b14f3ceada6a32397229e4ff9ab0')

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