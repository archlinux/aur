# Maintainer: ELmoussaoui Bilal <bil.elmoussaoui@gmail.com>

pkgname=nautilus-folder-icons
pkgver=2.3
_pkgver="v${pkgver}"
pkgrel=1
pkgdesc='Nautilus extension that makes changing folders icons easy!'
arch=('i686' 'x86_64')
license=('GPL3')
url="https://github.com/bil-elmoussaoui/${pkgname}"
depends=('gobject-introspection' 'gtk3' 'python-nautilus' 'nautilus')
makedepends=('gnome-common' 'meson' 'ninja' 'gettext' 'python' 'appstream-glib')

options=('!emptydirs')
source=("https://github.com/bil-elmoussaoui/${pkgname}/archive/${_pkgver}.tar.gz")
sha256sums=('450c25abff7d8e26fc3e9aed7597126ac62e16438f1dc378232de165a39f1965')
provides=("nautilus-folder-icons=${pkgver}")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  meson builddir --prefix=/usr
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  DESTDIR="${pkgdir}" ninja -C builddir install
}
