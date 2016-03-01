# Maintainer: Robin McCorkell <robin@mccorkell.me.uk>

pkgname=cryptodev-linux
pkgver=1.8
pkgrel=1
pkgdesc="cryptodev Linux module"
url='http://cryptodev-linux.org/'
license=("GPL")
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
makedepends=('linux-headers')
conflicts=('cryptodev_friendly')
provides=('cryptodev_friendly')
source=(http://download.gna.org/${pkgname}/${pkgname}-${pkgver}.tar.gz{,.sig})
md5sums=('02644cc4cd02301e0b503a332eb2f0b5'
         'SKIP')
validpgpkeys=('923973B07FB83A747B06146C9CC3E9AF16358427')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make INSTALL_MOD_PATH=${pkgdir}/usr DESTDIR=${pkgdir} PREFIX=${pkgdir} install
}
