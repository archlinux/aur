# Maintainer: Max Alt m@adine.design
pkgname=qlip
pkgver=v1.0.0
pkgrel=1
pkgdesc="Lightweight screenshot utility for linux"
arch=('any')
url="https://github.com/maxDTM/qlip"
license=('GPL-3.0-or-later')
depends=('python' 'tk')
optdepends=('maim: X11 screenshot capture'
            'slop: X11 region selection (used by maim)'
            'xdotool: X11 window/monitor detection'
            'xorg-xrandr: X11 monitor enumeration'
            'wmctrl: X11 improved window listing'
            'grim: Wayland screenshot capture'
            'slurp: Wayland region selection'
            'sway: Wayland monitor/window info (sway)'
            'hyprland: Wayland monitor/window info (Hyprland)'
            'wlr-randr: Wayland monitor enumeration (generic wlroots)')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('e9d4039987ba899523af1c9775a65de87c7c4d96166d7a65f0cc0816e675bf3d')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir" PREFIX=/usr install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 src/qlip.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/qlip.svg"
}
