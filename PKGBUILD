# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>
# ex-Maintainer: Ben Poest <ben@poest.com>
# Contributor: Philip Goto <philip.goto@gmail.com>

pkgname=textpieces
pkgver=3.1.0
pkgrel=1
pkgdesc="Transform text without using random websites"
arch=('x86_64' 'aarch64')
url="https://github.com/liferooter/textpieces"
license=('GPL3')
depends=('json-glib' 'libadwaita' 'python-pyaml' 'gtksourceview5' 'libgee')
makedepends=('gobject-introspection' 'meson' 'vala')
checkdepends=('appstream-glib')
source=($url/archive/v$pkgver.tar.gz)
b2sums=('904e96cdb97ca0d71dcbbe84e233099f5f8193118125b87a78bf504a5af96c4ff952118f4127571fd6c1306c789e60a40426c133685226fb68040d6e1a4dabaf')


build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
