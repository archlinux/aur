# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=randomgtk
_pkgname=random
pkgver=1.2
pkgrel=1
pkgdesc="A randomization app for GNOME"
arch=('x86_64')
url="https://codeberg.org/foreverxml/random"
license=('AGPL3')
depends=('glib2' 'gtk4' 'libadwaita' 'gdk-pixbuf2')
makedepends=('meson' 'vala')
checkdepends=('appstream-glib')
source=("${url}/archive/v${pkgver}.tar.gz")
b2sums=('926b9ba2acf138316aef339d30f42f626ab9acd8b73627a9cda2e142e1617060a78c4eb9014914330c73e5ccca4d1b5bf51bd7f6ca97847ee50872798ad18b57')

build() {
  arch-meson "$_pkgname" build
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
