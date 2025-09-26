# Maintainer: Abel GOMES <abel.gomes@etu.unistra.fr>

pkgname=wm
pkgver=2.1
pkgrel=1
pkgdesc="ASCII animation of tanks like sl but with war machines"
arch=('x86_64')
url="https://github.com/Bebel9445/wm"
license=('MIT')
depends=('ncurses')
source=("https://github.com/Bebel9445/wm/archive/v2.1.tar.gz")
sha256sums=('daf07d196701a8bf8e79cd38c77b7ae5ef42db78dd0318e2a818a8d90766c834')

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

