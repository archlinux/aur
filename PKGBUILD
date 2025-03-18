pkgname=better-control-git
pkgver=r57.gd505b13  # Removed the leading 0.
pkgrel=1
pkgdesc="A tool to manage system settings easily (git version)"
arch=('any')
url="https://github.com/quantumvoid0/better-control"
license=('GPL3')  # Adjust to correct license
depends=('python' 'gtk3' 'networkmanager' 'bluez' 'bluez-utils' 'pipewire-pulse' 'brightnessctl' 'cpupower' 'python-gobject' 'python-pydbus' 'python-psutil' 'gammastep')
makedepends=('git')
provides=('better-control')
conflicts=('better-control')
source=("git+https://github.com/quantumvoid0/better-control.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/better-control"
    echo "r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"  # Removed 0.
}

package() {
    cd "$srcdir/better-control"
    
    install -Dm755 src/control.py "$pkgdir/usr/bin/control"
    install -Dm644 src/control.desktop "$pkgdir/usr/share/applications/control.desktop"
}

