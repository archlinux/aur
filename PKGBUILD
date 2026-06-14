# Maintainer: Kostiantyn Kushnir <chpock@gmail.com>
pkgname=quickdashboard
pkgver=0.0.1
pkgrel=1
pkgdesc="Configurable Quickshell dashboard for Wayland"
arch=('any')
url="https://github.com/chpock/quickdashboard"
license=('GPL-3.0-or-later')
depends=(
    'quickshell'
    'qt6-graphs'
    'dgop'
    'iproute2'
    'iputils'
)
optdepends=(
    'iw: Wi-Fi SSID and signal strength in the network widget'
    'khal: calendar events widget'
    'vdirsyncer: calendar sync and refresh integration'
    'openusage-cli: AI usage limits widget'
)
provides=("$pkgname=$pkgver")
conflicts=('quickdashboard-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/chpock/quickdashboard/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('be0b29bd91476080434d178d8df103924f1091648a1d850d7585c8d77e78ad6b')

package() {
    cd "$srcdir/$pkgname-$pkgver"

    install -Dm755 "bin/quickdashboard" "$pkgdir/usr/bin/quickdashboard"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -d "$pkgdir/usr/share/$pkgname"
    cp -a \
        "shell.qml" \
        "DashboardDefault.qml" \
        "defaults.json" \
        "theme.json" \
        "widget.json" \
        "qd" \
        "$pkgdir/usr/share/$pkgname/"
}
