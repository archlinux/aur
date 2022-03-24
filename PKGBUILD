# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=passes
pkgver=0.2
pkgrel=1
pkgdesc="A digital pass manager"
arch=('any')
url="https://github.com/pablo-s/passes"
license=('GPL3')
depends=('gtk4' 'libadwaita' 'python-qrcode')
makedepends=('meson')
checkdepends=('appstream-glib')
source=($url/archive/v$pkgver.tar.gz)
b2sums=('b36ea982b617927131b08fb54270b299dcce9919ce35e3c70039e8d0c0621d95adc92bd09eeeb46f75dacdc7ca475a1218c4f4e59fcfbfaff73a6ce945736456')

build() {
  arch-meson "${pkgname%-git}-$pkgver" build
  meson compile -C build
}

#check() {
#  meson test -C build
#}

package() {
  meson install -C build --destdir "$pkgdir"
}
