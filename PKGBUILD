# Maintainer: Faugus <felix.ribeiro@live.com>

pkgname=faugus-launcher-git
pkgver=r118.5cedd44
pkgrel=1
pkgdesc="A simple and lightweight app for running Windows games using UMU-Launcher/UMU-Proton"
arch=('x86_64')
url="https://github.com/Faugus/faugus-launcher"
license=('MIT')
depends=('python' 'python-gobject' 'umu-launcher' 'p7zip')
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
    install -Dm644 faugus-launcher.desktop "$pkgdir/usr/share/applications/faugus-launcher.desktop"
    install -Dm644 faugus-shortcut.desktop "$pkgdir/usr/share/applications/faugus-shortcut.desktop"
    install -Dm644 faugus-launcher.png "$pkgdir/usr/share/icons/faugus-launcher.png"
}
