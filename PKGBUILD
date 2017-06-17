# Maintainer: ELmoussaoui Bilal <bil.elmoussaoui@gmail.com>

pkgname=nautilus-folder-icons
pkgver=1.2
pkgrel=1
pkgdesc='Nautilus extension that makes changing folders icons easy!'
arch=('i686' 'x86_64')
license=('GPL3')
url="https://github.com/bil-elmoussaoui/${pkgname}"
depends=('gobject-introspection' 'gtk3' 'python2-nautilus' 'nautilus')
makedepends=('gnome-common' 'meson' 'ninja' 'gettext' 'python' 
'appstream-glib')

options=('!emptydirs')
source=("https://github.com/bil-elmoussaoui/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('ebdbdad853b15cbe0b13728c8f3c520fe57cb620dd4cd289f1b96c4576557c32')
provides=("nautilus-folder-icons=$pkgver")

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  meson builddir --prefix=/usr
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  DESTDIR="${pkgdir}" ninja -C builddir install
}
