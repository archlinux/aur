# Maintainer: crimist <aur at crim dot ist>
# Contributor: skrewball <aur at joickle dot com>

pkgname=gnome-shell-extension-color-picker
_pkgbase=tuberry-color-picker
pkgver=46
_commit=677f12b
pkgrel=1
pkgdesc='Simple color picker for Gnome Shell'
arch=(any)
url='https://github.com/tuberry/color-picker'
license=('GPL3')
depends=('dconf' 'gnome-shell')
makedepends=('meson' 'sassc')
source=("${_pkgbase}-${_commit}.tar.gz::${url}/tarball/${_commit}")
sha256sums=('0f80084b2a16fd04a0ba46874dd1cd93ad4ee71333362b0e7dbc3072b316cc9d')

build() {
  arch-meson $_pkgbase-$_commit build --reconfigure -Dversion=${pkgver} -Dtarget=system
}

package() {
  meson install -C build --destdir "$pkgdir"
}
