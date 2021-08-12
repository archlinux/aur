# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=typography
pkgver=0.1.0
pkgrel=1
pkgdesc="Tool for working with the GNOME typography design guidelines"
arch=('any')
url="https://gitlab.gnome.org/World/design/typography"
license=('GPL3')
depends=('gtk4')
makedepends=('meson')
checkdepends=('appstream-glib')
source=($url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('7990df024495c6018f066273b91ab8f6bf27e4ea2dc2f506bc18420b4ed769b0')

build() {
  arch-meson $pkgname-$pkgver build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
}