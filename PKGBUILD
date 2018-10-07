# Maintainer: willemw <willemw12@gmail.com>

pkgname=indicator-sensors
pkgver=0.8
pkgrel=3
pkgdesc="Small application to provide hardware sensor readings using the AppIndicator framework"
arch=('x86_64')
url="https://github.com/alexmurray/indicator-sensors"
license=('GPL3')
depends=('dconf' 'gobject-introspection' 'libappindicator-gtk3' 'libatasmart' 'libnotify' 'libpeas' 'lm_sensors' 'udisks2')
optdepends=('libxnvctrl: NVIDIA GPU support')
makedepends=('gnome-common' 'intltool')
install=$pkgname.install
source=(https://github.com/alexmurray/$pkgname/archive/$pkgver.tar.gz)
md5sums=('2975c3b04778e18b549356383a3740d8')

build() {
  cd $pkgname-$pkgver
  sh ./autogen.sh
  ./configure --disable-schemas-compile --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

