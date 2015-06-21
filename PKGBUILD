# Contributor: schuay <jakob.gruber@gmail.com>
# Contributor: rennero <rennero@bastardi.net>
pkgname=hasciicam
pkgver=1.1.2
pkgrel=1
pkgdesc="Renders video input as ascii (either to the terminal, to a text file, or a live webpage)"
url="http://ascii.dyne.org/"
depends=('aalib' 'libv4l' 'ftplib')
arch=('i686' 'x86_64')
install=${pkgname}.install
source=("https://files.dyne.org/.xsend.php?file=hasciicam/releases/${pkgname}_$pkgver.tar.gz")
md5sums=('2c7393270e18ab913043683fa3390d8c')
license=('GPL')

build() {
  cd "${srcdir}"/${pkgname}-$pkgver
  
  sed -i 's_\(Iconsdir.*\)icons$_\1pixmaps_; /Menu_DATA/d' share/Makefile.am
  ./configure --prefix="${pkgdir}"/usr --mandir="${pkgdir}"/usr/share/man

  make
}
package() {
  cd "${srcdir}"/${pkgname}-$pkgver
  make install
}
