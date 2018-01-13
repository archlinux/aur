# Maintainer: ELmoussaoui Bilal <bil.elmoussaoui@gmail.com>

pkgname=dippi
pkgver=2.3.3
pkgrel=1
pkgdesc='Calculate display info like DPI and aspect ratio'
arch=('i686' 'x86_64')
license=('GPL3')
url="https://github.com/cassidyjames/dippi"
depends=('gtk3' 'gobject-introspection' 'libgee' 'granite')
makedepends=('gnome-common' 'desktop-file-utils' 'meson' 'gettext' 'appstream-glib' 'vala')
options=('!emptydirs')
source=("https://github.com/cassidyjames/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('0839ff2d66121cd76f86abb77cd2535ae0d0840fc08354e388065f902df6c97d')
provides=("dippi=${pkgver}")

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	meson builddir --prefix=/usr
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
  DESTDIR="${pkgdir}" ninja -C builddir install
}
