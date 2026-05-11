# Maintainer: Filipe Teixeira <filipeh291@gmail.com>

pkgname=waytimer
pkgver=1.0.1
pkgrel=1
pkgdesc="Simple activity timer with fuzzel menu and waybar integration"
arch=('any')
url="https://github.com/filipeoliv02/waytimer"
license=('MIT')
depends=('python' 'fuzzel')
optdepends=('waybar: waybar integration')
source=("$pkgname-$pkgver.tar.gz::https://github.com/filipeoliv02/waytimer/archive/v$pkgver.tar.gz")
sha256sums=('415147a4502ebbe60460527dc1528ca7a9a0b1bcf76731d809d111866c0e47ba')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 waytimer.py "$pkgdir/usr/bin/waytimer"
    install -Dm644 waybar-config.jsonc "$pkgdir/usr/share/waytimer/waybar-config.jsonc"
    install -Dm644 waybar-style.css "$pkgdir/usr/share/waytimer/waybar-style.css"
    install -Dm644 README.md "$pkgdir/usr/share/doc/waytimer/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
