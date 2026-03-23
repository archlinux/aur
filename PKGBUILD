# Maintainer: onyxdigitaldev <dev@onyxdigital.dev>
pkgname=dell-fanctl
pkgver=1.0.0
pkgrel=1
pkgdesc='Adaptive fan controller for Dell laptops — auto-switches quiet/gaming profiles based on CPU load and temperature'
arch=('any')
url='https://github.com/onyxdigitaldev/dell-fanctl'
license=('MIT')
depends=('python>=3.10')
optdepends=(
    'python-gobject: system tray applet'
    'libappindicator-gtk3: system tray applet'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('35b70ab3eec8b67cad4bd0ef9a1262e73a23f0097b8121e8262fc1d0f845dec8')

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 bin/dell-fanctl "$pkgdir/usr/bin/dell-fanctl"
    install -Dm755 bin/dell-fanctl-tray "$pkgdir/usr/bin/dell-fanctl-tray"
    install -Dm644 systemd/dell-fanctl.service "$pkgdir/usr/lib/systemd/system/dell-fanctl.service"
    install -Dm644 systemd/dell-fanctl-tray.desktop "$pkgdir/etc/xdg/autostart/dell-fanctl-tray.desktop"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
