# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=typography
pkgver=0.1.0
pkgrel=1
pkgdesc="Tool for working with the GNOME typography design guidelines"
arch=('any')
url="https://gitlab.gnome.org/World/design/typography"
license=('GPL3')
depends=('gtk4')
makedepends=('git' 'meson')
source=("git+${url}.git#tag=${pkgver}")
md5sums=('SKIP') #autofill using updpkgsums

build() {
  arch-meson $pkgname build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
}