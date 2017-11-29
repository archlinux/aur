# Maintainer: ELmoussaoui Bilal <bil.elmoussaoui@gmail.com>

pkgname=nautilus-folder-icons
pkgver=2.1.1
pkgrel=1
pkgdesc='Nautilus extension that makes changing folders icons easy!'
arch=('i686' 'x86_64')
license=('GPL3')
url="https://github.com/bil-elmoussaoui/${pkgname}"
depends=('gobject-introspection' 'gtk3' 'python2-nautilus' 'nautilus')
makedepends=('gnome-common' 'meson' 'ninja' 'gettext' 'python' 'appstream-glib')

options=('!emptydirs')
source=("https://github.com/bil-elmoussaoui/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('e00f1d520b899b5974951c523d5d5a0ed7cac409e1c2b7445284123ea406f6d4')
provides=("nautilus-folder-icons=${pkgver}")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  meson builddir --prefix=/usr
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  DESTDIR="${pkgdir}" ninja -C builddir install
}
