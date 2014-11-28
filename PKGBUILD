# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=libhtp
pkgver=0.2.8
pkgrel=1
pkgdesc="HTP library"
arch=('i686' 'x86_64')
url="http://www.openinfosecfoundation.org/index.php/downloads"
license=('GPL2')
options=('!libtool')
source=(http://www.openinfosecfoundation.org/download/htp-$pkgver.tar.gz)
sha256sums=('ea5107a3e6e1994a29b69f82bcf853273ecfd45100189ddb7959c291f0572f17')

build() {
  cd ${srcdir}/htp-$pkgver

  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/htp-$pkgver

  make DESTDIR=${pkgdir} install
}
