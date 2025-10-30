# Maintainer:
# Contributor: Piotr Miller <nwg.piotr@gmail.com>

_pkgname="nwg-launchers"
pkgname="$_pkgname"
pkgver=0.7.1.1
pkgrel=1
pkgdesc="GTK+ launchers for sway, i3 and some other WMs"
url="https://github.com/nwg-piotr/nwg-launchers"
license=('GPL-3.0-or-later')
arch=('x86_64')

depends=(
  'gtk-layer-shell'
  'gtk3'
  'gtkmm3'
)
makedepends=(
  'git'
  'meson'
  'nlohmann-json'
)

_pkgsrc="$_pkgname-$pkgver"
_pkgext="tar.gz"
source=("$_pkgsrc.$_pkgext"::"$url/archive/v$pkgver.$_pkgext")
sha256sums=('3700fe67870ecead091abe672c93ce01a6351cb1e0be1904233050c22e86a7c4')

build() {
  arch-meson "$_pkgsrc" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
