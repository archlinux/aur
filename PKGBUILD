# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=gaw3
pkgver=20200922
pkgrel=1
pkgdesc="Gtk analog waveform viewer - tool for viewing analog data, such as the output of Spice simulations"
arch=('i686' 'x86_64')
url="http://www.rvq.fr/linux/gaw.php"
license=('GPL')
depends=('gtk3')
optdepends=('alsa-lib')
provides=('gaw')
conflicts=('gaw')
source=(http://download.tuxfamily.org/gaw/download/${pkgname}-$pkgver.tar.gz)
md5sums=('91eb6020fdf2174e70ad14301732a052')

build() {
  cd ${pkgname}-$pkgver
  ./configure --prefix=/usr
  make
}


package() {
  cd ${pkgname}-$pkgver
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
