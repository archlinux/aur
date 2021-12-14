# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: ELmoussaoui Bilal <bil dot elmoussaoui at gmail dot com>

pkgname=dippi
pkgver=3.1.4
pkgrel=1
pkgdesc='Calculate display info like DPI and aspect ratio'
arch=('i686' 'x86_64')
license=('GPL3')
url="https://github.com/cassidyjames/dippi"
depends=('gtk3' 'gobject-introspection' 'libgee' 'granite' 'libhandy')
makedepends=('gnome-common' 'desktop-file-utils' 'meson' 'gettext' 'appstream-glib' 'vala')
options=('!emptydirs')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/cassidyjames/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('8edb5cbbc38ac1da5c1c2106d96dac9259579cc4abe1bd41cf5c26983a9f0bd9')
provides=("dippi=${pkgver}")

build() {
  arch-meson "${srcdir}/${pkgname}-${pkgver}" "${srcdir}/build"
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C "${srcdir}/build"
}
