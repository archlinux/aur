# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=letterpress
pkgver=2.1
pkgrel=1
pkgdesc="Uses jp2a to turn your pictures into images made up of ASCII Characters."
arch=('any')
url="https://apps.gnome.org/Letterpress"
license=('GPL-3.0-or-later')
depends=('jp2a' 'libadwaita' 'python-gobject' 'python-pillow')
makedepends=('blueprint-compiler' 'meson')
source=("https://gitlab.gnome.org/World/Letterpress/-/archive/$pkgver/Letterpress-$pkgver.tar.gz")
sha256sums=('6682bfd13f15ae12ccd556531974a0a4f701775d5e55e50e1a97b71b9dcab375')

build() {
  arch-meson "Letterpress-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
