# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=gnome-calculator
pkgname=${_pkgname}-gtk3
pkgver=41.1
pkgrel=1
pkgdesc="GNOME Scientific calculator (last GTK3 release)"
url="https://wiki.gnome.org/Apps/Calculator"
arch=(x86_64)
license=(GPL)
depends=('gtk3' 'dconf' 'gtksourceview4' 'mpfr' 'libsoup' 'libmpc' 'libgee' 'libhandy')
makedepends=('yelp-tools' 'vala' 'git' 'meson' 'gobject-introspection')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("https://gitlab.gnome.org/GNOME/gnome-calculator/-/archive/${pkgver}/${_pkgname}-${pkgver}.tar.bz2")
sha256sums=('d99a6517094444d400f580f5386a0e6a857fc4826e5d3422f732c269600b7ffc')

build() {
  arch-meson "${_pkgname}-${pkgver}" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"
}
