# Maintainer: Victor Sosa <victorsosadev@gmail.com>

pkgname=vswaybar-studio
pkgver=1.4.0
pkgrel=1
pkgdesc="A visual configuration editor for Waybar — build, style and preview your bar in real time"
arch=('any')
url="https://github.com/victorsosaMx/vsWaybar-Studio"
license=('MIT')
depends=(
    'python'
    'python-gobject'
    'python-cairo'
    'webkit2gtk-4.1'
    'waybar'
)
optdepends=(
    'matugen: palette generation from wallpaper image (Styling tab)'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/victorsosaMx/vsWaybar-Studio/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('58f2be5043c3daf029e49d9607b3d4bcdab6853619770f043255ed1226f48d00')

package() {
    cd "vsWaybar-Studio-$pkgver"

    # main executable
    install -Dm755 vswaybar-studio        "$pkgdir/usr/bin/vswaybar-studio"

    # license
    install -Dm644 LICENSE                "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # docs
    install -Dm644 README.md              "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 CHANGELOG.md           "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"

    # bundled scripts (installed by the app to ~/.config/waybar/scripts/ on demand)
    install -Dm755 vsbar.py               "$pkgdir/usr/share/$pkgname/vsbar.py"
    install -Dm644 weather.py             "$pkgdir/usr/share/$pkgname/weather.py"
    install -Dm755 weather.sh             "$pkgdir/usr/share/$pkgname/weather.sh"
    install -Dm644 weather.conf.template  "$pkgdir/usr/share/$pkgname/weather.conf.template"
}
