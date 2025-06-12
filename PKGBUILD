# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=master-key
pkgver=1.7.1
pkgrel=1
pkgdesc="A password manager application"
arch=('any')
url="https://gitlab.com/guillermop/master-key"
license=('GPL-3.0-or-later')
depends=('libadwaita' 'python-gobject' 'libpwquality' 'sqlcipher' 'tcl')
makedepends=('meson' 'gobject-introspection' 'blueprint-compiler')
checkdepends=('appstream-glib' 'desktop-file-utils')
source=($url/-/archive/v$pkgver/$pkgname-v$pkgver.tar)
b2sums=('b8ec63a2fed2153a332ba3e81f55d2de65782353c72abbb52c5261366f9f1aa4bfa80e1d177ee066568458df56759f173f4fc8236809b7750dbc680a0784dc38')

build() {
  arch-meson "$pkgname-v$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}





