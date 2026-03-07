# Maintainer: novik133 <your-email@example.com>

pkgname=novadock
_pkgname=NovaDock
pkgver=0.1.3
pkgrel=1
pkgdesc="A macOS/GNOME-style dock and application launcher for XFCE4"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/novik133/NovaDock"
license=('GPL3')
depends=('gtk3' 'libwnck3' 'libkeybinder3' 'gtk-layer-shell')
makedepends=('vala' 'meson' 'ninja')
source=("$pkgname-$pkgver.tar.gz::https://github.com/novik133/NovaDock/archive/v$pkgver.tar.gz")
sha256sums=('eedb58db26c683695f24e622fad680543a03b17a760924c8ca6fe93cce72f4b7')

build() {
    cd "$srcdir/${_pkgname}-$pkgver"
    arch-meson . build
    meson compile -C build
}

package() {
    cd "$srcdir/${_pkgname}-$pkgver"
    meson install -C build --destdir "$pkgdir"
}
