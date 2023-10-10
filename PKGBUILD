# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: ELmoussaoui Bilal <bil dot elmoussaoui at gmail dot com>

pkgname=dippi
pkgver=4.0.5
pkgrel=1
pkgdesc='Calculate display info like DPI and aspect ratio'
arch=('i686' 'x86_64')
license=('GPL3')
url="https://github.com/cassidyjames/dippi"
depends=('gtk4' 'gobject-introspection' 'libgee' 'libadwaita')
makedepends=('gnome-common' 'desktop-file-utils' 'meson' 'gettext' 'appstream-glib' 'vala')
options=('!emptydirs')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/cassidyjames/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('ef79c579892e92f86c57fcaf0440d1b6c260c720bf636ff4e055c63e3d8d6759')
provides=("dippi=${pkgver}")

build() {
  arch-meson "${srcdir}/${pkgname}-${pkgver}" "${srcdir}/build"
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C "${srcdir}/build"
}
