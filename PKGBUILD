# Maintainer: Filipe Teixeira <filipeh291@gmail.com>

pkgname=waytimer
pkgver=1.0.0
pkgrel=1
pkgdesc="Simple activity timer with fuzzel menu and waybar integration"
arch=('any')
url="https://github.com/filipeoliv02/waytimer"
license=('MIT')
depends=('python' 'fuzzel')
optdepends=('waybar: waybar integration')
source=("$pkgname-$pkgver.tar.gz::https://github.com/filipeoliv02/waytimer/archive/v$pkgver.tar.gz")
sha256sums=('3cc5083410f27f1a2dc0d71dc44a665da9c84857be917434d545854f488022b6')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 waytimer.py "$pkgdir/usr/bin/waytimer"
    install -Dm644 waybar-config.jsonc "$pkgdir/usr/share/waytimer/waybar-config.jsonc"
    install -Dm644 waybar-style.css "$pkgdir/usr/share/waytimer/waybar-style.css"
    install -Dm644 README.md "$pkgdir/usr/share/doc/waytimer/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
