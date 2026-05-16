# Maintainer: segarra <aur@manuelsegarra.com>
pkgname=headset-battery-indicator-git
pkgver=r79.ea0eadc
pkgrel=1
pkgdesc="System tray headset battery indicator with ChatMix and Sidetone controls"
arch=('any')
url="https://github.com/ruflas/headset-battery-indicator"
license=('GPL3')
depends=('headsetcontrol' 'pyside6')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel')
provides=('headset-battery-indicator')
conflicts=('headset-battery-indicator')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd headset-battery-indicator
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd headset-battery-indicator
    python -m build --wheel --no-isolation
}

package() {
    cd headset-battery-indicator
    python -m installer --destdir="$pkgdir" dist/*.whl
}
