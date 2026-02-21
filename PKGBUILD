# Maintainer: Luis Bocanegra <luisbocanegra17b at gmail dot com>
_gitname=plasma-panel-spacer-extended
pkgname=plasma6-applets-panel-spacer-extended
pkgver=1.13.0
pkgrel=1
pkgdesc="Mouse gestures for the KDE Plasma Panel, drag window, run any shortcut, command, application with configurable mouse actions!"
arch=('any')
url="https://github.com/luisbocanegra/plasma-panel-spacer-extended"
license=('GPL3')
depends=('plasma-workspace' 'kdeplasma-addons')
makedepends=('extra-cmake-modules')
source=("${_gitname}-${pkgver}.tar.gz::$url/archive/v${pkgver}/${_gitname}-${pkgver}.tar.gz")
sha256sums=('2ac6dc31c4d5a6cb7032ad13275ae9c4357dc112c68ef3109b468520290d1e82')

build() {
  cd "${srcdir}/${_gitname}-$pkgver"
  cmake -B build -S .
  cmake --build build
}

package() {
  cd "${srcdir}/${_gitname}-$pkgver"
  DESTDIR="$pkgdir" cmake --install build
  chmod 755 "$pkgdir/usr/share/plasma/plasmoids/luisbocanegra.panelspacer.extended/contents/ui/tools/get_shortcuts.sh"
  chmod 755 "$pkgdir/usr/share/plasma/plasmoids/luisbocanegra.panelspacer.extended/contents/ui/tools/run_kwin_script.sh"
}
