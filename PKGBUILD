# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=letterpress
pkgver=2.0
pkgrel=2
pkgdesc="Uses jp2a to turn your pictures into images made up of ASCII Characters."
arch=('any')
url="https://apps.gnome.org/Letterpress"
license=('GPL-3.0-or-later')
depends=('jp2a' 'libadwaita' 'python-gobject' 'python-pillow')
makedepends=('blueprint-compiler' 'meson')
checkdepends=('appstream-glib')
source=("https://gitlab.gnome.org/World/Letterpress/-/archive/$pkgver/Letterpress-$pkgver.tar.gz")
sha256sums=('34c457f30af4eeb58785d125eb596859abc64a519625829d69008d10581b1951')

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
