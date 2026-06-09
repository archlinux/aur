# Maintainer: Laith Masri <laith.masri@gmail.com>
pkgname=zenbook-duo-hyprland
pkgver=0.1.0
pkgrel=1
pkgdesc="Dual-screen auto-toggle, Bluetooth keyboard, and face unlock setup for ASUS Zenbook Duo on Hyprland"
arch=('any')
url="https://github.com/laithm/zenbook-duo-hyprland"
license=('MIT')
depends=('hyprland' 'bash' 'bluez-utils' 'systemd')
optdepends=('howdy-next: IR face unlock'
            'linux-enable-ir-emitter: enable the IR camera for Howdy')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2bfe44fd493b6f60c432ed4dc7c03165ba1c2ee31997a960149a335535d61e58')

package() {
    cd "$srcdir/$pkgname-$pkgver"

    install -Dm755 bin/zenbook-duo-screen "$pkgdir/usr/bin/zenbook-duo-screen"
    install -Dm755 bin/zenbook-duo-setup  "$pkgdir/usr/bin/zenbook-duo-setup"

    install -Dm644 lib/common.sh   "$pkgdir/usr/lib/$pkgname/common.sh"
    install -Dm644 lib/screen.sh   "$pkgdir/usr/lib/$pkgname/screen.sh"
    install -Dm644 lib/keyboard.sh "$pkgdir/usr/lib/$pkgname/keyboard.sh"
    install -Dm644 lib/faceid.sh   "$pkgdir/usr/lib/$pkgname/faceid.sh"

    install -Dm644 share/exec-once.snippet           "$pkgdir/usr/share/$pkgname/exec-once.snippet"
    install -Dm644 share/config.example              "$pkgdir/usr/share/$pkgname/config.example"
    install -Dm644 share/zenbook-duo-screen.service  "$pkgdir/usr/share/$pkgname/zenbook-duo-screen.service"

    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE   "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
