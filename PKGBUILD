# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=gabtag
pkgver=12
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
sha256sums=('d2391bd23713bff7dfa940135497e7ec2689fe4b8ffa2e5e58cbbc4e17f62268')

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
