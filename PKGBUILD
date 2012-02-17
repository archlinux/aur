# Maintainer:
# Contributor: Kritoke <kritoke@gamebox.net>

pkgname=libsidplay
pkgver=1.36.59
pkgrel=5
pkgdesc="A library for playing SID music files."
arch=('i686' 'x86_64')
url="http://critical.ch/distfiles/"
license=('GPL')
options=('!libtool')
source=(http://critical.ch/distfiles/${pkgname}-${pkgver}.tgz libsidplay-1.36.59-gcc43.patch)
md5sums=('37c51ba4bd57164b1b0bb7b43b9adece' 'c24d7bca2639f4fee03c40c7dcaadfee')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  patch -Np1 -i $srcdir/libsidplay-1.36.59-gcc43.patch
  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install || return 1
}
