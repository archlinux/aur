# Maintainer: Martin Filion <mordillo98@gmail.com>

pkgname=gnome-disk-utility-3.4.1
pkgver=3.4.1
pkgrel=1
pkgdesc="gnome disk utility 3.4.1"
arch=('i686' 'x86_64')
url="https://gitlab.gnome.org/GNOME/gnome-disk-utility"
license=('GPL2')
provides=("gnome-disk-utility=$pkgver")
conflicts=('gnome-disk-utility')
depends=('gtk3' 'intltool' 'udisks2')
source=("http://ftp.gnome.org/pub/gnome/sources/gnome-disk-utility/3.4/gnome-disk-utility-3.4.1.tar.xz")
md5sums=('c5ff303fdc99d6bf85b9fa8e886a99dd')

build() {
  cd "${srcdir}/${pkgname}"
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="${pkgdir}" install
}

