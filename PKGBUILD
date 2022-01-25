# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=gabtag
pkgver=4
pkgrel=1
pkgdesc="A Linux application to handle audio tags (Gtk3)"
arch=('x86_64')
url="https://github.com/lachhebo/GabTag"
license=('GPL3')
depends=('gtk3' 'python-mutagen' 'python-cairo' 'python-musicbrainzngs'
         'python-pylyrics' 'python-gobject' 'python-pillow')
makedepends=('meson')
checkdepends=('appstream-glib')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('ec22c1d69ce7e3e17fff7c02c731cf746fc23eea05bdc0854d5bf304f6b16b2d')

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
