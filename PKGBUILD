# Maintainer: Faugus <felix.ribeiro@live.com>

pkgname=faugus-launcher
pkgver=1.6.2
pkgrel=1
pkgdesc="A simple and lightweight app for running Windows games using UMU-Launcher"
arch=('any')
url="https://github.com/Faugus/faugus-launcher"
license=('MIT')
depends=('python' 'python-gobject' 'python-requests' 'python-pillow' 'python-filelock' 'python-vdf' 'python-psutil' 'umu-launcher' 'imagemagick' 'icoextract' 'libayatana-appindicator')
optdepends=('gamescope')
provides=('faugus-launcher')
conflicts=('faugus-launcher')
source=("https://github.com/Faugus/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('SKIP')

package() {
    cd ${pkgname}-${pkgver}
    install -Dm755 faugus_launcher.py "$pkgdir/usr/bin/faugus-launcher"
    install -Dm755 faugus_run.py "$pkgdir/usr/bin/faugus-run"
    install -Dm755 faugus_proton_manager.py "$pkgdir/usr/bin/faugus-proton-manager"
    install -Dm755 faugus_components.py "$pkgdir/usr/bin/faugus-components"
    install -Dm644 faugus-launcher.desktop "$pkgdir/usr/share/applications/faugus-launcher.desktop"
    install -Dm644 faugus-shortcut.desktop "$pkgdir/usr/share/applications/faugus-shortcut.desktop"
    install -Dm644 faugus-run.desktop "$pkgdir/usr/share/applications/faugus-run.desktop"
    install -Dm644 faugus-proton-manager.desktop "$pkgdir/usr/share/applications/faugus-proton-manager.desktop"
    install -Dm644 assets/faugus-launcher.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/faugus-launcher.png"
    install -Dm644 assets/faugus-battlenet.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/faugus-battlenet.png"
    install -Dm644 assets/faugus-ea.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/faugus-ea.png"
    install -Dm644 assets/faugus-epic-games.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/faugus-epic-games.png"
    install -Dm644 assets/faugus-ubisoft-connect.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/faugus-ubisoft-connect.png"
    install -Dm644 assets/faugus-banner.png "$pkgdir/usr/share/faugus-launcher/faugus-banner.png"
    install -Dm644 assets/faugus-notification.ogg "$pkgdir/usr/share/faugus-launcher/faugus-notification.ogg"
    install -Dm644 assets/faugus-add-symbolic.svg "$pkgdir/usr/share/icons/hicolor/scalable/actions/faugus-add-symbolic.svg"
    install -Dm644 assets/faugus-exit-symbolic.svg "$pkgdir/usr/share/icons/hicolor/scalable/actions/faugus-exit-symbolic.svg"
    install -Dm644 assets/faugus-kill-symbolic.svg "$pkgdir/usr/share/icons/hicolor/scalable/actions/faugus-kill-symbolic.svg"
    install -Dm644 assets/faugus-play-symbolic.svg "$pkgdir/usr/share/icons/hicolor/scalable/actions/faugus-play-symbolic.svg"
    install -Dm644 assets/faugus-settings-symbolic.svg "$pkgdir/usr/share/icons/hicolor/scalable/actions/faugus-settings-symbolic.svg"
    install -Dm644 assets/faugus-stop-symbolic.svg "$pkgdir/usr/share/icons/hicolor/scalable/actions/faugus-stop-symbolic.svg"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"

    find languages -type f -name "*.mo" | while read -r mo_file; do
        lang=$(basename $(dirname "$mo_file"))
        install -Dm644 "$mo_file" "$pkgdir/usr/share/locale/$lang/LC_MESSAGES/$(basename "$mo_file")"
    done
}
