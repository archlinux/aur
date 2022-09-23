# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=libshumate
pkgver=1.0.1
pkgrel=1
pkgdesc="GTK toolkit providing widgets for embedded maps"
arch=('x86_64' 'aarch64')
url="https://wiki.gnome.org/Projects/libshumate"
license=('LGPL')
depends=('gtk4')
makedepends=('gi-docgen' 'gobject-introspection' 'gtk-doc' 'meson' 'vala')
conflicts=("${pkgname}-git")
source=("${pkgname}-${pkgver}.tar.gz::https://gitlab.gnome.org/GNOME/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.bz2")
b2sums=('2463de4bf85215a0d63ff40f35fd18a36135f78cf518a88e51309624a8397b10658fe1a5fa14533ea366823ffe5881b3e4b6fe2968c56d068b9498f826123f65')

build() {
  arch-meson "${pkgname}-${pkgver}" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"
}
