# Maintainer: Victor Sosa <victorsosadev@gmail.com>

pkgname=vswaybar-studio
pkgver=1.0.0
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
sha256sums=('72c4c5a872b14ff727ff83ef7dd72db989a21d3f0e9ac07f9791ee345408c1b4')

package() {
    cd "vsWaybar-Studio-$pkgver"

    # main executable
    install -Dm755 vswaybar-studio        "$pkgdir/usr/bin/vswaybar-studio"

    # license
    install -Dm644 LICENSE                "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # docs
    install -Dm644 README.md              "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 CHANGELOG.md           "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"

    # weather script template (user copies to ~/.config/waybar/scripts/)
    install -Dm644 weather.py             "$pkgdir/usr/share/$pkgname/weather.py"
    install -Dm644 weather.conf.template  "$pkgdir/usr/share/$pkgname/weather.conf.template"
}
