# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=xde-applets
pkgver=0.7
pkgrel=1
pkgdesc="X Desktop Environment System Tray Icons and Dock Apps"
groups=('xde')
arch=('i686' 'x86_64')
url="https://github.com/bbidulock/xde-applets"
license=('GPL')
depends=('libsm' 'libwnck+-git' 'libcanberra' 'libnotify' 'lm_sensors'
		'libpackagekit-glib' 'cpupower' 'upower')
makedepends=('dbus-glib' 'libunique' 'xorgproto')
optdepends=('xdg-launch-git: launch with recent update and launch notification')
source=("https://github.com/bbidulock/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.lz")
md5sums=('a119b60c7c2604e057a72106b147a5a3')

build() {
  cd $pkgname-$pkgver
  ./configure
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
