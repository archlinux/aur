# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=gnome-shell-extension-nightthemeswitcher
_pkgname=nightthemeswitcher-gnome-shell-extension
pkgver=64
pkgrel=1
pkgdesc="Automatically toggle your light and dark themes variants"
arch=('any')
url="https://gitlab.com/rmnvgr/nightthemeswitcher-gnome-shell-extension"
license=('GPL3')
groups=('gnome-shell-extensions')
depends=('gnome-shell>=1:42')
makedepends=('glib2' 'meson')
checkdepends=('reuse' 'eslint')
source=($url/-/archive/$pkgver/$_pkgname-$pkgver.tar)
b2sums=('0daf772dd1df7adea002f75609fbd59a6cfccebfa1efbc9c039c2a49aa00491ddd2e2d17154419d73cdc8fc4162339819107424315505ef0453f47b898d0c37e')

build() {
  arch-meson "${_pkgname}-${pkgver}" build
  meson compile -C build
}

#check() {
#  meson test -C build
#}

package() {
  meson install -C build --destdir "$pkgdir"
}
