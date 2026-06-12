# Maintainer: annoyedmilk
pkgname=airpods-tui-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="Terminal UI for managing AirPods on Linux over Bluetooth AACP (prebuilt binary)"
arch=('x86_64')
url="https://github.com/annoyedmilk/airpods-tui"
license=('GPL-3.0-or-later')
depends=('bluez' 'dbus' 'libpulse')
optdepends=(
    'pipewire: audio routing'
    'wireplumber: volume control via wpctl'
    'swayosd: volume OSD overlay'
)
provides=('airpods-tui')
conflicts=('airpods-tui' 'airpods-tui-git')
install=airpods-tui.install
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/airpods-tui-$pkgver-x86_64.tar.gz")
sha256sums=('d79fc8cdbe1005e2dcc8b0422f2cf87669d117bad9e466ba5a66fc372c09adfb')

package() {
    cd "airpods-tui-$pkgver-x86_64"
    install -Dm755 airpods-tui "$pkgdir/usr/bin/airpods-tui"
    install -Dm644 airpods-tui.service "$pkgdir/usr/lib/systemd/user/airpods-tui.service"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
