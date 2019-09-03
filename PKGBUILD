# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=xde-applets
pkgver=0.5
pkgrel=1
pkgdesc="X Desktop Environment System Tray Icons and Dock Apps"
groups=('xde-git')
arch=('i686' 'x86_64')
url="https://github.com/bbidulock/xde-applets"
license=('GPL')
depends=('libxss' 'libxxf86misc' 'libsm' 'libwnck+-git' 'libcanberra' 'libnotify' 'lm_sensors'
		'libpackagekit-glib' 'cpupower' 'upower')
makedepends=('dbus-glib' 'libunique')
optdepends=('xdg-launch-git: launch with recent update and launch notification')
source=("https://github.com/bbidulock/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.lz")
md5sums=('05a4153dcc1ba4f2cac8f064fd773032')

build() {
  cd $pkgname-$pkgver
  ./configure --sysconfdir=/etc
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
