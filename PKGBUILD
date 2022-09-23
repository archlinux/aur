# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=gabtag
pkgver=11
pkgrel=1
pkgdesc="A Gtk Linux application to handle audio tags"
arch=('any')
url="https://github.com/lachhebo/GabTag"
license=('GPL3')
depends=('libadwaita' 'python-cairo' 'python-gobject' 'python-musicbrainzngs'
         'python-mutagen' 'python-pillow')
makedepends=('meson')
checkdepends=('appstream-glib')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('abce3c730a5e352a0a97852f3cded135a145daa7e6c1288920eeb6dbbacde430')

build() {
  arch-meson "GabTag-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
