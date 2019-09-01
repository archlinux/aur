# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=xde-ctools
pkgver=1.9
pkgrel=1
pkgdesc="X Desktop Environment C-language tools"
groups=('xde')
arch=('i686' 'x86_64')
url="https://github.com/bbidulock/xde-ctools"
license=('GPL')
depends=('libxss' 'libxxf86misc' 'libsm' 'libwnck+' 'libcanberra' 'libnotify')
makedepends=('dbus-glib' 'libunique')
optdepends=('xdg-launch: launch with recent update and launch notification')
source=("https://github.com/bbidulock/xde-ctools/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.lz")
sha256sums=('d1f8befbb63e9db5d2abc2e8094656ccf56b44e74ebb133deec50a885fbb8724')

build() {
  cd $pkgname-$pkgver
  ./configure --sysconfdir=/etc
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
