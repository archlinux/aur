# Maintainer: Aditya <contact@aditya-verma.me>
pkgname=fuzz-wall
pkgver=1.1.0
pkgrel=1
pkgdesc="A fuzzel-based wallpaper picker supporting multiple WMs and wallpaper setters"
arch=('any')
url="https://github.com/youngcoder45/fuzz-wall"
license=('MIT')
depends=('fuzzel')
optdepends=(
    'swaybg: Wayland wallpaper setter (sway)'
    'swww: Wayland wallpaper setter with animations (hyprland)'
    'feh: X11 wallpaper setter'
    'nitrogen: X11 wallpaper setter with GUI'
    'xwallpaper: Lightweight X11 wallpaper setter'
    'libnotify: Desktop notifications support'
    'libvips: Wallpaper thumbnail previews in fuzzel'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
# NOTE: regenerate with `updpkgsums` AFTER pushing the v1.1.0 tag to GitHub.
sha256sums=('c38ed8dbbf864981f5b885a5093a52bd736bb4e4947201e425f95792caa148e9')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 fuzz-wall "$pkgdir/usr/bin/fuzz-wall"
    install -Dm644 fuzz-wall.desktop "$pkgdir/usr/share/applications/fuzz-wall.desktop"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
