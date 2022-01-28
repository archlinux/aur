# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=gabtag
pkgver=5
pkgrel=1
pkgdesc="A Linux application to handle audio tags (Gtk3)"
arch=('any')
url="https://github.com/lachhebo/GabTag"
license=('GPL3')
depends=('gtk3' 'libhandy' 'python-cairo' 'python-gobject' 'python-musicbrainzngs'
         'python-mutagen' 'python-pillow')
makedepends=('meson')
checkdepends=('appstream-glib')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('3539e2781d98ef3758a463b34f29274ed0416614af8cd4f5311813181d8b47f4')

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
