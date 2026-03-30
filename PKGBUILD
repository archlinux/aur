# Maintainer: Victor Sosa <victorsosadev@gmail.com>

pkgname=vswaybar-studio
pkgver=1.2.0
pkgrel=1
pkgdesc="A visual configuration editor for Waybar — build, style and preview your bar in real time"
arch=('any')
url="https://github.com/victorsosaMx/vsWaybar-Studio"
license=('MIT')
depends=(
    'python'
    'python-gobject'
    'python-cairo'
    'waybar'
)
optdepends=(
    'matugen: palette generation from wallpaper image'
    'swaync: notification center module support'
    'wlogout: power menu module support'
    'kitty: terminal emulator for the updates module'
    'pavucontrol: audio control (pulseaudio module on-click)'
    'network-manager-applet: network settings (network module on-click)'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/victorsosaMx/vsWaybar-Studio/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e103a6f3a0c88b5105953ee99b8024a78610fb69c6a59e7887cb55adcab72f43')

package() {
    cd "vsWaybar-Studio-$pkgver"

    # main executable
    install -Dm755 vswaybar-studio        "$pkgdir/usr/bin/vswaybar-studio"

    # license
    install -Dm644 LICENSE                "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # docs
    install -Dm644 README.md              "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 CHANGELOG.md           "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"

    # weather scripts (bundled defaults loaded by the app when user files don't exist)
    install -Dm644 weather.py             "$pkgdir/usr/share/$pkgname/weather.py"
    install -Dm755 weather.sh             "$pkgdir/usr/share/$pkgname/weather.sh"
    install -Dm644 weather.conf.template  "$pkgdir/usr/share/$pkgname/weather.conf.template"
}
