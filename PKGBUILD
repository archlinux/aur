# Maintainer: Giovanni 'ItachiSan' Santini <giovannisantini93@yahoo.it>
# Contributor: NanoArch <nanoarch77@gmail.com>

pkgname=gdm3setup
pkgver=20150813
pkgrel=2
pkgdesc="An interface to configure GDM3 and autologin options"
arch=(any)
license=('GPL')
url="http://github.com/Nano77/gdm3setup"
source=(https://raw.github.com/Nano77/various/master/src/$pkgname/master/$pkgname-$pkgver.tar.xz)
depends=(gdm gnome-shell python2-gobject python2-lxml python2-dbus
         'gdm3setup-utils>=20150507')
optdepends=('archlinux-artwork: Set an Archlinux logo')
conflicts=('gdm3setup-native-theme' 'gdm3setup-vala' 'gdm3setup-vala-native-theme')
sha256sums=('8724e0369f9fb9cda61135d3a78e5d5546eb167a6fcf30132ff6431419ad587d')

build() {
  cd ${srcdir}/$pkgname-$pkgver
  make
}

package() {
  cd ${srcdir}/$pkgname-$pkgver
  make DESTDIR=${pkgdir} install
}
