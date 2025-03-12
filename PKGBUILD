pkgname=better-control-git
pkgver=2dab8b5
pkgrel=1
pkgdesc="A tool to manage system settings easily (git version)"
arch=('any')
url="https://github.com/quantumvoid0/better-control"
license=('GPL3')
depends=('gtk4' 'networkmanager' 'bluez' 'bluez-utils' 'pipewire-pulse' 'brightnessctl' 'python-gobject' 'python-pydbus' 'python3')
makedepends=('git')
provides=('better-control')
conflicts=('better-control')
source=("git+https://github.com/quantumvoid0/better-control.git#branch=main")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/better-control"
    git rev-parse --short HEAD
}

package() {
    cd "$srcdir/better-control"
    install -Dm755 $srcdir/better-control/src/control.py "$pkgdir/usr/bin/control"
    install -Dm644 $srcdir/better-control/src/control.desktop "$pkgdir/usr/share/applications/control.desktop"
}

