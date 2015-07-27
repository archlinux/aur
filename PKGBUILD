# Maintainer: NanoArch <nanoarch77@gmail.com>

pkgname=gdm3setup
pkgver=20150507
pkgrel=1
pkgdesc="An interface to configure GDM3 and autologin options"
arch=(any)
license=('GPL')
url="http://github.com/Nano77/gdm3setup"
source=(https://raw.github.com/Nano77/various/master/src/$pkgname/master/$pkgname-$pkgver.tar.xz)
depends=('gdm' 'gnome-shell' 'python2-lxml' 'python2-dbus' 'gdm3setup-utils>=20150507')
optdepends=('archlinux-artwork: Set an Archlinux logo')
conflicts=('gdm3setup-native-theme' 'gdm3setup-vala' 'gdm3setup-vala-native-theme')
sha256sums=('890790d07afca426bffd42eabc59038d47c8bc08233e9286ab4331e81ba6b3ce')

build() {
  cd ${srcdir}/$pkgname-$pkgver
  make
}

package() {
  cd ${srcdir}/$pkgname-$pkgver
  make DESTDIR=${pkgdir} install
}
