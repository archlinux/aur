# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=randomgtk
_pkgname=random
pkgver=0.9
pkgrel=1
pkgdesc="A randomization app for GNOME"
arch=('x86_64')
url="https://codeberg.org/foreverxml/random"
license=('AGPL3')
depends=('glib2' 'gtk4' 'libadwaita' 'gdk-pixbuf2')
makedepends=('meson' 'vala')
checkdepends=('appstream-glib')
source=("${url}/archive/v${pkgver}.tar.gz")
sha512sums=('69630d5b741eacdcbfcdfe1bc912ea86e566bd8ef828363ef64442cde48fdadbd9c01cd73de5b091c8437021d9cf7d06ddebe294f6f15dc6653416e197f1ee58')

build() {
  arch-meson "$_pkgname" build
  meson compile -C build
}

#check() {
#  meson test -C build --print-errorlogs
#}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
