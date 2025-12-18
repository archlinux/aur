# Maintainer: Faugus <felix.ribeiro@live.com>

pkgname=faugus-launcher-git
pkgver=r659.764c6b7
pkgrel=2
pkgdesc="A simple and lightweight app for running Windows games using UMU-Launcher"
arch=('any')
url="https://github.com/Faugus/faugus-launcher"
license=('MIT')
depends=('python' 'python-gobject' 'python-requests' 'python-pillow' 'python-filelock' 'python-vdf' 'python-psutil' 'imagemagick' 'icoextract' 'libayatana-appindicator')
makedepends=('git' 'meson')
provides=('faugus-launcher')
conflicts=('faugus-launcher')
source=("git+https://github.com/Faugus/faugus-launcher.git")
sha256sums=('SKIP')

build() {
    cd "faugus-launcher"
    arch-meson . build
    meson compile -C build
}

package() {
    cd "faugus-launcher"
    DESTDIR="${pkgdir}" meson install -C build
}
