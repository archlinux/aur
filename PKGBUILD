# Maintainer: willemw <willemw12@gmail.com>

pkgname=indicator-sensors
pkgver=1.1
pkgrel=1
pkgdesc="Small application to provide hardware sensor readings using the AppIndicator framework"
arch=('x86_64')
url="https://github.com/alexmurray/indicator-sensors"
license=('GPL3')
depends=('dconf' 'gobject-introspection' 'libappindicator-gtk3' 'libatasmart' 'libnotify' 'libpeas' 'lm_sensors' 'udisks2')
optdepends=('libxnvctrl: NVIDIA GPU support')
makedepends=('gnome-common' 'intltool')
install=$pkgname.install
source=(https://github.com/alexmurray/$pkgname/archive/$pkgver.tar.gz)
md5sums=('bdf30513ebde28b545f49e75b107a571')

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

