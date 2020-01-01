# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Hervé Quillévéré <http://www.rvq.fr/php/mailme.php>
pkgname=gaw
pkgver=20170605
pkgrel=1
pkgdesc="Gtk analog waveform viewer - tool for viewing analog data, such as the output of Spice simulations"
arch=('i686' 'x86_64')
url="http://www.rvq.fr/linux/gaw.php"
license=('GPL')
depends=('gtk2')
optdepends=('alsa-lib')
source=(http://download.tuxfamily.org/gaw/download/${pkgname}2-$pkgver.tar.gz)
md5sums=('62f512dc42c789c115b2e51498307c1f')

build() {
  cd ${pkgname}2-$pkgver
  ./configure --prefix=/usr
  make
}


package() {
  cd ${pkgname}2-$pkgver
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
