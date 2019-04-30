# Maintainer: Josef Vybihal <josef dot vybihal at gmail dot com>
# Old Maintainer: Jeff Henson <jeff at henson dot io>
# Old Maintainer: cuihao <cuihao dot leo at gmail dot com>
# Original PKGBUILD (community/gstm):
# Contributor: Roman Kyrylych <Roman.Kyrylych@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=gstm
pkgver=1.3.3
pkgrel=3
pkgdesc="Gnome SSH Tunnel Manager - Gtk3 Edition"
arch=('i686' 'x86_64')
url="https://github.com/dallenwilson/gstm"
license=('GPL')
depends=('openssh' 'libxml2' 'glib2' 'gdk-pixbuf2' 'gtk3')
makedepends=('intltool')
source=(https://github.com/dallenwilson/gstm/releases/download/1.3.3/gstm-${pkgver}.tar.gz)
sha256sums=('84d982763589b22be4dff593de2cb2e2e907093b9bcca70dbb1fe6859043852a')

build() {
   cd ${srcdir}/gstm-${pkgver}
   ./configure --prefix=/usr
   make || return 1
}

package() {
   cd ${srcdir}/gstm-${pkgver}
   make DESTDIR=${pkgdir} install
}
