# Maintainer: Advnirr <vnaosov@gmail.com>
pkgname=hanuchi
pkgver=2.0.0
pkgrel=1
pkgdesc="Minimalist GTK4 frontend for LogMeIn Hamachi"
arch=('any')
url="https://github.com/Advnirr/hanuchi"
license=('MIT')
depends=('python' 'gtk4' 'libadwaita' 'python-gobject' 'logmein-hamachi')
makedepends=('meson')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Advnirr/hanuchi/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ff4dbb14d3d782e17a3195664b5f1892c7e7df85d5fe6d10837862afe8a1c29e')

build() {
    meson setup "${pkgname}-${pkgver}" build \
        --prefix=/usr \
        --buildtype=plain
    meson compile -C build
}

package() {
    meson install -C build --destdir "${pkgdir}"
}
