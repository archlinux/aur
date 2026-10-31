# Maintainer: Advnirr <vnaosov@gmail.com>
pkgname=hanuchi
pkgver=2.1.0
pkgrel=1
pkgdesc="Minimalist GTK4 frontend for LogMeIn Hamachi"
arch=('any')
url="https://github.com/Advnirr/hanuchi"
license=('MIT')
depends=('python' 'gtk4' 'libadwaita' 'python-gobject' 'logmein-hamachi')
makedepends=('meson')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Advnirr/hanuchi/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6b9b25dc95e498f5b99c38293a8e0c91284d8ca2d5478fe196c4e4fa2182fe19')

build() {
    meson setup "${pkgname}-${pkgver}" build \
        --prefix=/usr \
        --buildtype=plain
    meson compile -C build
}

package() {
    meson install -C build --destdir "${pkgdir}"
}
