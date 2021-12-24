# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=junction
_pkgname=Junction
pkgver=1.4.0
pkgrel=1
pkgdesc="Application/browser chooser"
arch=('x86_64')
url="https://github.com/sonnyp/Junction"
license=('GPL3')
depends=('glib2' 'gtk4' 'libadwaita' 'gjs')
makedepends=('meson')
checkdepends=('appstream-glib')
source=($url/archive/v$pkgver.tar.gz)
b2sums=('cb4d21c968cf3a5015da9a6e558500a538cd68c7700b5c71ac60e9d729f3c37ebbd29d2747b6228e7a1c42a3fb91c48d00d28fde0130c3085ee841b869c941eb')

build() {
  arch-meson "$_pkgname-$pkgver" build
  meson compile -C build
}

#check() {
#  meson test -C build
#}

package() {
  meson install -C build --destdir "$pkgdir"
}
