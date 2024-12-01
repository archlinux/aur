# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=master-key
pkgver=1.7.0
pkgrel=1
pkgdesc="A password manager application"
arch=('any')
url="https://gitlab.com/guillermop/master-key"
license=('GPL-3.0-or-later')
depends=('libadwaita' 'python-gobject' 'libpwquality' 'sqlcipher' 'tcl')
makedepends=('meson' 'gobject-introspection' 'blueprint-compiler')
checkdepends=('appstream-glib' 'desktop-file-utils')
source=($url/-/archive/v$pkgver/$pkgname-v$pkgver.tar)
b2sums=('42bd2c47dd2911a045f3a4d24ccb9d8eaa1767f94bb0d1c51211a219410203a7e6db0ec2a047a88434b379bedb4c894a4c8334d08b14e924e838d02525bb4a13')

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





