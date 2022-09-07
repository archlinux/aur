# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=libshumate
pkgver=1.0.0.beta
pkgrel=1
pkgdesc="GTK toolkit providing widgets for embedded maps"
arch=('x86_64' 'aarch64')
url="https://wiki.gnome.org/Projects/libshumate"
license=('LGPL')
depends=('gtk4')
makedepends=('gi-docgen' 'git' 'gobject-introspection' 'gtk-doc' 'meson' 'vala')
conflicts=("${pkgname}-git")
source=("${pkgname}-${pkgver}.tar.gz::https://gitlab.gnome.org/GNOME/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('8bdd81c67143e69ff571e67cee9e2bd20e67f893dfa65863bc552c34a068ba66')

build() {
  arch-meson "${pkgname}-${pkgver}" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"
}
