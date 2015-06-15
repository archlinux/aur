#! /bin/bash
# Contributor: Paolo Stivanin <garrett16@hotmail.it>
# Contributor: Andrea Scarpino <bash.lnx@gmail.com>
# Maintainer: Jorge Barroso <jorge.barroso.11@gmail.com>

pkgname=gnome-vfs-obexftp
pkgver=0.4
pkgrel=6
pkgdesc="Browse bluetooth devices through nautilus"
url="http://ftp.gnome.org/pub/GNOME/sources/gnome-vfs-obexftp/"
license=('GPL')
arch=('any')
depends=('gnome-vfs' 'dbus-glib' 'openobex' 'bluez-libs')
source=(http://ftp.gnome.org/pub/GNOME/sources/gnome-vfs-obexftp/0.4/$pkgname-$pkgver.tar.bz2)
sha512sums=('0e5e79d34fd33076d4639d2b4b7dd120b2b3cff9cad28a16214040cf8fb44be85a83180a4f271fdd51ffdbbbe9aeb879f569b59fde15a5391beb6b243977681b')
options=('!libtool')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {

make DESTDIR=$startdir/pkg install
}

# vim:set ts=2 sw=2 et: