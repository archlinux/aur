# Maintainer: NanoArch <nanoarch77@gmail.com>

pkgname=gdm3setup-utils
pkgver=20150507
pkgrel=1
pkgdesc="Utilities to configure GDM3, autologin options and change Shell theme"
arch=(any)
license=('GPL')
url="http://github.com/Nano77/gdm3setup"
source=(https://raw.github.com/Nano77/various/master/src/$pkgname/$pkgname-$pkgver.tar.xz)


depends=('gdm' 'gnome-shell' 'python2-dbus')
conflicts=('gdm3setup-daemon-native-theme' 'gdm3setup-vala' 'gdm3setup-vala-native-theme')
sha256sums=('07d6e79ee4fd2ae27272106f7f9512ed6e404c782fa0c8582c6302236156fcf7')

build() {
  cd ${srcdir}/$pkgname-$pkgver
  make 
}

package() {
  cd ${srcdir}/$pkgname-$pkgver
  make DESTDIR=${pkgdir} install
}
