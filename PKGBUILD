# Maintainer: ELmoussaoui Bilal <bil.elmoussaoui@gmail.com>

pkgname=nautilus-folder-icons
pkgver=2.1
pkgrel=1
pkgdesc='Nautilus extension that makes changing folders icons easy!'
arch=('i686' 'x86_64')
license=('GPL3')
url="https://github.com/bil-elmoussaoui/${pkgname}"
depends=('gobject-introspection' 'gtk3' 'python2-nautilus' 'nautilus')
makedepends=('gnome-common' 'meson' 'ninja' 'gettext' 'python' 'appstream-glib')

options=('!emptydirs')
source=("https://github.com/bil-elmoussaoui/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('4d51b18fcd7b7d0899ef94279658e88fac5d400f9f6c32bd83bf9d3b943c003d')
provides=("nautilus-folder-icons=${pkgver}")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  meson builddir --prefix=/usr
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  DESTDIR="${pkgdir}" ninja -C builddir install
}
