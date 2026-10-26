# Maintainer: wins1ey <wins1ey at wins1ey dot win>
pkgname=libresplit
pkgver=0.3.0
pkgrel=1
pkgdesc="Free speedrun timer with auto splitting and load removal."
arch=('x86_64')
url='https://libresplit.org'
license=('GPL-3.0-or-later')
depends=(
    'gtk4'
    'jansson'
    'lua54'
)
makedepends=(
    'meson'
)
optdepends=(
    'glib-networking: web split icons'
    'gvfs: web split icons'
)

source=("$pkgname-$pkgver.tar.gz::https://github.com/LibreSplit/LibreSplit/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8b6cb54d14f327579003e9ade678205017a3dcf2e964614880b5c6040cb2590a')

build() {
    cd "LibreSplit-$pkgver"
    arch-meson . build
    meson compile -C build
}

package() {
    cd "LibreSplit-$pkgver"
    meson install -C build --destdir "$pkgdir"
}
