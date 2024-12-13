# Maintainer: Faugus <felix.ribeiro@live.com>

pkgname=faugus-launcher-git
pkgver=r260.4d29325
pkgrel=1
pkgdesc="A simple and lightweight app for running Windows games using UMU-Launcher"
arch=('x86_64')
url="https://github.com/Faugus/faugus-launcher"
license=('MIT')
depends=('python' 'python-gobject' 'python-requests' 'python-pillow' 'umu-launcher' 'imagemagick' 'icoextract' 'libappindicator-gtk3')
makedepends=(git)
provides=('faugus-launcher')
conflicts=('faugus-launcher')
source=("git+https://github.com/Faugus/faugus-launcher.git")
sha256sums=('SKIP')

pkgver() {
    cd "faugus-launcher"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "faugus-launcher"
    install -Dm755 faugus-launcher.py "$pkgdir/usr/bin/faugus-launcher"
    install -Dm755 faugus-run.py "$pkgdir/usr/bin/faugus-run"
    install -Dm755 faugus-proton-manager.py "$pkgdir/usr/bin/faugus-proton-manager"
    install -Dm755 faugus-components.py "$pkgdir/usr/bin/faugus-components"
    install -Dm644 faugus-launcher.desktop "$pkgdir/usr/share/applications/faugus-launcher.desktop"
    install -Dm644 faugus-shortcut.desktop "$pkgdir/usr/share/applications/faugus-shortcut.desktop"
    install -Dm644 faugus-launcher.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/faugus-launcher.png"
    install -Dm644 faugus-battlenet.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/faugus-battlenet.png"
    install -Dm644 faugus-ea.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/faugus-ea.png"
    install -Dm644 faugus-epic-games.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/faugus-epic-games.png"
    install -Dm644 faugus-ubisoft-connect.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/faugus-ubisoft-connect.png"
    install -Dm644 faugus-banner.png "$pkgdir/usr/share/faugus-launcher/faugus-banner.png"
}
