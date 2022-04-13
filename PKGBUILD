# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=gnome-shell-extension-nightthemeswitcher
_pkgname=nightthemeswitcher-gnome-shell-extension
pkgver=63
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
b2sums=('71eebb039948d2ecff06d16cce8d1a3f48d0e74115d06627a8a995a9b4a3d66f2fc4fa5f6d01e6659fdc7b7d0257074541686dde96661664607dfa41a857909b')

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
