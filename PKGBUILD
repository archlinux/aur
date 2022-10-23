# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=libshumate
pkgver=1.0.2
pkgrel=1
pkgdesc="GTK toolkit providing widgets for embedded maps"
arch=('x86_64' 'aarch64')
url="https://wiki.gnome.org/Projects/libshumate"
license=('LGPL')
depends=('gtk4')
makedepends=('gi-docgen' 'gobject-introspection' 'gtk-doc' 'meson' 'vala')
conflicts=("${pkgname}-git")
source=("${pkgname}-${pkgver}.tar.gz::https://gitlab.gnome.org/GNOME/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.bz2")
b2sums=('93daf32899d0177a5fda9dff2f7129bdde46b27d339e739fe47892f8abdda6d093728cf59bf0901508404a2ee40a0f80955420efe9120398d62737fb6ed0ace9')

build() {
  arch-meson "${pkgname}-${pkgver}" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"
}
