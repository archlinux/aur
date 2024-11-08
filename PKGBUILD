# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=master-key
pkgver=1.6.2
pkgrel=1
pkgdesc="A password manager application"
arch=('any')
url="https://gitlab.com/guillermop/master-key"
license=('GPL-3.0-or-later')
depends=('libadwaita' 'python-gobject' 'libpwquality' 'sqlcipher' 'tcl')
makedepends=('meson' 'gobject-introspection' 'blueprint-compiler')
checkdepends=('appstream-glib' 'desktop-file-utils')
source=($url/-/archive/v$pkgver/$pkgname-v$pkgver.tar)
b2sums=('72a437b8c23779bdac875aebdc57bea88cb5e11107c1e3380261c878df74ea5b70cbdc4d2502640919340b4931f29690214520a7d82649462d61b7ef8986b42b')

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





