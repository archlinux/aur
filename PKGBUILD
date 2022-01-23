# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=gabtag
pkgver=3
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
sha256sums=('90a24768f699d6169d98ff56e76da8531cf69c39215cc3a1e6ed1f6d0b7f5f04')

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
