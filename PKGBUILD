# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: ELmoussaoui Bilal <bil dot elmoussaoui at gmail dot com>

pkgname=dippi
pkgver=3.1.2
pkgrel=1
pkgdesc='Calculate display info like DPI and aspect ratio'
arch=('i686' 'x86_64')
license=('GPL3')
url="https://github.com/cassidyjames/dippi"
depends=('gtk3' 'gobject-introspection' 'libgee' 'granite' 'libhandy')
makedepends=('gnome-common' 'desktop-file-utils' 'meson' 'gettext' 'appstream-glib' 'vala')
options=('!emptydirs')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/cassidyjames/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('d2a57fbd873441c207fd74e3dbe77ad59406bc2a98da8bcf9d306054a67135a5')
provides=("dippi=${pkgver}")

build() {
  arch-meson "${srcdir}/${pkgname}-${pkgver}" "${srcdir}/build"
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C "${srcdir}/build"
}
