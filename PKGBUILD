# Maintainer: ZephyrDRH <zephyrdrh at gmx dot de>
# Contributor: Andrew Sun <adsun701 at gmail dot com>
# Contributor: ELmoussaoui Bilal <bil dot elmoussaoui at gmail dot com>

pkgname=dippi
pkgver=4.2.0
pkgrel=1
pkgdesc='Calculate display info like DPI and aspect ratio'
arch=('i686' 'x86_64')
license=('GPL-3.0-or-later')
url="https://github.com/cassidyjames/dippi"
depends=('gtk4' 'gobject-introspection' 'libgee' 'libadwaita')
makedepends=('gnome-common' 'desktop-file-utils' 'meson' 'gettext' 'appstream-glib' 'vala')
options=('!emptydirs')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/cassidyjames/${pkgname}/archive/${pkgver}.tar.gz")
b2sums=('5277f234afac6f3d0f2c73a58be3044457573feae1083241632516a46566d972ea40969e579be3b2f61475f20e8a7e6e315d2937936fd9804dabee5e211474a7')

build() {
  arch-meson "${srcdir}/${pkgname}-${pkgver}" "${srcdir}/build"
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C "${srcdir}/build"
}
