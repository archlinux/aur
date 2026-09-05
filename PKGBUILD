# Maintainer: Advnirr <vnaosov@gmail.com>
pkgname=hanuchi
pkgver=2.0.1
pkgrel=1
pkgdesc="Minimalist GTK4 frontend for LogMeIn Hamachi"
arch=('any')
url="https://github.com/Advnirr/hanuchi"
license=('MIT')
depends=('python' 'gtk4' 'libadwaita' 'python-gobject' 'logmein-hamachi')
makedepends=('meson')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Advnirr/hanuchi/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('29215cffd967467fa315c929a30587e30ca5f138ae651adf9ca0e2d9486d5456')

build() {
    meson setup "${pkgname}-${pkgver}" build \
        --prefix=/usr \
        --buildtype=plain
    meson compile -C build
}

package() {
    meson install -C build --destdir "${pkgdir}"
}
