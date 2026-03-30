# Maintainer: Victor Sosa <victorsosadev@gmail.com>

pkgname=vshyprland-manager
pkgver=1.2.0
pkgrel=1
pkgdesc="Visual configuration editor for Hyprland — edit window manager settings with live preview"
arch=('any')
url="https://github.com/victorsosaMx/vsHyprland-Manager"
license=('MIT')
depends=(
    'python'
    'python-gobject'
    'python-cairo'
    'hyprland'
)
optdepends=(
    'awww: wallpaper daemon (required for wallpaper management)'
    'hyprexpo: overview plugin configuration support'
    'hyprfocus: focus animation plugin configuration support'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/victorsosaMx/vsHyprland-Manager/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('83fdb020fd4fd1e79ea3034c8ceb31ca34adebe6e881185bdc98584bd9048cea')

package() {
    cd "vsHyprland-Manager-$pkgver"

    # main executable
    install -Dm755 vshyprland-manager \
        "$pkgdir/usr/bin/vshyprland-manager"

    # desktop entry
    install -Dm644 vshyprland-manager.desktop \
        "$pkgdir/usr/share/applications/vshyprland-manager.desktop"

    # icon (512x512 — closest standard size to our 1024px source)
    install -Dm644 vshyprland-manager.png \
        "$pkgdir/usr/share/icons/hicolor/512x512/apps/vshyprland-manager.png"

    # license
    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # docs
    install -Dm644 README.md    "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}
