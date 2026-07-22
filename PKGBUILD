# Maintainer: aur.chaotic.cx

_pkgname="pebbles"
pkgname="$_pkgname"
pkgver=3.1.0
pkgrel=1
pkgdesc="An easy to use yet powerful calculator app"
url="https://github.com/SubhadeepJasu/pebbles"
license=('GPL-3.0-or-later')
arch=('x86_64')

depends=(
  'granite7'
  'gtk4'
  'libadwaita'
  'python'
  'python-dateutil'
  'python-gobject'
  'python-matplotlib'
  'python-numpy'
)
makedepends=(
  'blueprint-compiler'
  'gobject-introspection'
  'meson'
  'sassc'
  'vala'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname-$pkgver"
_pkgext="tar.gz"
source=("$_pkgsrc.$_pkgext"::"$url/archive/refs/tags/v$pkgver.$_pkgext")
sha256sums=('9abd936192b227e20ddf343c77336179aa5a143b4e9fc0acd6b113d46e9f6d21')

build() {
  arch-meson build "$_pkgsrc"
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
