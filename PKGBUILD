# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=rnote
pkgver=0.2.5
pkgrel=1
pkgdesc="A simple note taking application written in Rust and GTK4"
arch=('x86_64')
url="https://github.com/flxzt/rnote"
license=('GPL3')
depends=('gtk4' 'glib2' 'libadwaita' 'poppler-glib' 'gstreamer')
makedepends=('meson' 'rust')
checkdepends=('appstream-glib')
source=($url/archive/v$pkgver.tar.gz)
b2sums=('57de9791f5d1b05f7a7fe8f43f5a95bc6aab1983c8cd1562f18d1ae4390482fc15f46b5eade9d259f49361a2b0a11bc2021ea49bca9c688ef004966cc8db2fdd')

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

#check() {
#  meson test -C build
#}

package() {
  meson install -C build --destdir "$pkgdir"
}
