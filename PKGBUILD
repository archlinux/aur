# Maintainer: Advnirr <vnaosov@gmail.com>
pkgname=hanuchi
pkgver=1.3.0
pkgrel=1
pkgdesc="Minimalist GTK4 frontend for LogMeIn Hamachi"
arch=('any')
url="https://github.com/Advnirr/hanuchi"
license=('MIT')
depends=('python' 'gtk4' 'libadwaita' 'python-gobject' 'logmein-hamachi')
makedepends=('meson')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Advnirr/hanuchi/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('82bd710131824c40c6a61fed5047cea6c31cd0eb642ae9e26b9a21024e55205c')

build() {
    meson setup "${pkgname}-${pkgver}" build \
        --prefix=/usr \
        --buildtype=plain
    meson compile -C build
}

package() {
    meson install -C build --destdir "${pkgdir}"
}
