# Maintainer: ELmoussaoui Bilal <bil.elmoussaoui@gmail.com>

pkgname=nautilus-folder-icons
pkgver=2.2
_pkgver="v${pkgver}"
pkgrel=1
pkgdesc='Nautilus extension that makes changing folders icons easy!'
arch=('i686' 'x86_64')
license=('GPL3')
url="https://github.com/bil-elmoussaoui/${pkgname}"
depends=('gobject-introspection' 'gtk3' 'python2-nautilus' 'nautilus')
makedepends=('gnome-common' 'meson' 'ninja' 'gettext' 'python' 'appstream-glib')

options=('!emptydirs')
source=("https://github.com/bil-elmoussaoui/${pkgname}/archive/${_pkgver}.tar.gz")
sha256sums=('e0a74518715ea386cfcaca4428e71b630dadfa9d689d5fc0d16341179c9f7afb')
provides=("nautilus-folder-icons=${pkgver}")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  meson builddir --prefix=/usr
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  DESTDIR="${pkgdir}" ninja -C builddir install
}
