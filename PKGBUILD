# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=nostalgia
pkgver=0.5
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
sha256sums=('ff8e63abfcbc68aa27c6a9bcbcc84d184975cf235abf2aff40de5341cbc96a7e')


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
