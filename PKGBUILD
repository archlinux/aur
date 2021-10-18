# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=chirurgien
_pkgname=Chirurgien
pkgver=1.2
pkgrel=1
pkgdesc="Chirurgien helps understand and manipulate file formats"
arch=('x86_64')
url="https://github.com/leonardschardijn/Chirurgien"
license=('GPL3')
depends=('gtk4' 'glib2')
makedepends=('meson')
checkdepends=('appstream-glib')
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('5ced1900a9e6a0ff6fd8bf21bb19489d954118170be26dd3b37e4f0f535e0be7e68d4143dce7927f4894838d1005483bfefea70dcd713ac1204885ca957841d9')

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
