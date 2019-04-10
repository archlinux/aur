# Maintainer: Andrew Sun <adsun701@gmail.com>
# Contributor: ELmoussaoui Bilal <bil.elmoussaoui@gmail.com>

pkgname=dippi
pkgver=2.7.3
pkgrel=1
pkgdesc='Calculate display info like DPI and aspect ratio'
arch=('i686' 'x86_64')
license=('GPL3')
url="https://github.com/cassidyjames/dippi"
depends=('gtk3' 'gobject-introspection' 'libgee' 'granite')
makedepends=('gnome-common' 'desktop-file-utils' 'meson' 'gettext' 'appstream-glib' 'vala')
options=('!emptydirs')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/cassidyjames/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('f11fba48e2dba490b404574027c18e2c8f45b1965df8d5ae512ebe0abae9900e')
provides=("dippi=${pkgver}")

build() {
  arch-meson "${srcdir}/${pkgname}-${pkgver}" "${srcdir}/build"
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C "${srcdir}/build"
}
