# Maintainer: Martin Filion <mordillo98@gmail.com>
# Last Modification: 2024-02-26

pkgname=gnome-disk-utility-3.4.1
pkgver=3.4.1
pkgrel=1
pkgdesc="gnome disk utility 3.4.1"
arch=('i686' 'x86_64')
url="https://gitlab.gnome.org/GNOME/gnome-disk-utility"
license=('GPL2')
provides=("gnome-disk-utility=$pkgver")
conflicts=('gnome-disk-utility')
depends=('cairo' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'hicolor-icon-theme' 'pango' 'udisks2')
makedepends=('intltool')
source=("http://ftp.gnome.org/pub/gnome/sources/gnome-disk-utility/3.4/gnome-disk-utility-3.4.1.tar.xz")
md5sums=('c5ff303fdc99d6bf85b9fa8e886a99dd')

build() {

  export CFLAGS="-Wno-error"

  cd "${srcdir}/${pkgname}"
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="${pkgdir}" install
}

