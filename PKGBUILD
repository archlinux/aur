# Maintainer: GDucpm <ducpm2306@gmail.com>
pkgname=ttybatd
pkgver=1.0.0
pkgrel=4
pkgdesc="A basic battery monitor that yells at you when you have 15% left, then yells at you again when you have 7% left with a dramatic 20-second-countdown-till-suspension twist."
arch=('any')
url="https://github.com/gducpm/ttybatd"
license=('GPL3')
depends=('libnotify')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9c5eb2a26b31c4eb6f99a07c12e7ebeccf29cea4b814e417631f212c9c0aa668')
install=$pkgname.install
package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 ttybatd "$pkgdir/usr/bin/ttybatd"
    install -Dm644 ttybatd.service "$pkgdir/usr/lib/systemd/system/ttybatd.service"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
