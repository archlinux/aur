# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=chirurgien
_pkgname=Chirurgien
pkgver=1.3
pkgrel=1
pkgdesc="Chirurgien helps understand and manipulate file formats"
arch=('x86_64')
url="https://github.com/leonardschardijn/Chirurgien"
license=('GPL3')
depends=('gtk4' 'glib2')
makedepends=('meson')
checkdepends=('appstream-glib')
source=(${url}/archive/v${pkgver}.tar.gz)
b2sums=('536428b81b6976410a4151d250ba67bbd3603f855000cfdef7c7a38d271208b39b84cfb956382433b48c68a9dc9a78621ed6d5bb164b5cb015e67b738491ee40')

build() {
  arch-meson $_pkgname-$pkgver build
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
