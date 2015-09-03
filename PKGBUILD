# Maintainer: Andreas Hauser <andy-aur@splashground.de>

pkgbase=ffindex
pkgdesc="simple index/database for huge amounts of small files"
pkgver=0.9.9.6
pkgrel=1
url=http://www.splashground.de/~andy/programs/FFindex
arch=i686
arch=x86_64
license=('CCPL:cc-by-sa-3.0')
source=http://www.splashground.de/~andy/programs/FFindex/ffindex-${pkgver}.tar.gz
sha256sums=5d49575dda35f33c0f9226e2ecf84aa4838dfd3df27e448c50683123450f846c
pkgname=ffindex


build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	make
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	make INSTALL_DIR=${pkgdir}/usr install
  mv ${pkgdir}/usr/lib64 ${pkgdir}/usr/lib
}
