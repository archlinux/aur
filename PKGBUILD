# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=nostalgia
pkgver=0.4
pkgrel=1
pkgdesc="Set historic GNOME wallpapers"
arch=(i686 x86_64 armv7h aarch64)
url="https://gitlab.gnome.org/bertob/nostalgia"
license=(GPL3)
depends=(gtk3)
makedepends=(gobject-introspection
             meson
             vala)
source=("https://gitlab.gnome.org/bertob/nostalgia/-/archive/$pkgver/nostalgia-$pkgver.tar.gz")
sha256sums=('044be070bac4c620a8a71e347605a4c78b6095c720157f72814117109188b95f')


build() {
    arch-meson nostalgia-${pkgver} build
    ninja -C build
}

# check() {
#     meson test -C build --print-errorlogs
# }

package() {
    DESTDIR="$pkgdir/" meson install  -C build
}
