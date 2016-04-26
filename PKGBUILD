# Maintainer: Andreas Hauser <andy-aur@splashground.de>

pkgbase=ffindex
pkgdesc="simple index/database for huge amounts of small files"
pkgver=0.9.9.7
pkgrel=2
url=http://www.splashground.de/~andy/programs/FFindex
arch=(x86_64 i686)
license=('CCPL:cc-by-sa-3.0')
source=("http://www.splashground.de/~andy/programs/FFindex/ffindex-${pkgver}.tar.gz")
sha256sums=('c4c6e6be9eaf352fed795635f09df55da0a5c00dfa6ca2e463690bee3504ca03')
pkgname=ffindex
depends=(openmpi)


build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	make HAVE_MPI=1
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	make INSTALL_DIR=${pkgdir}/usr install HAVE_MPI=1
  mv ${pkgdir}/usr/lib64 ${pkgdir}/usr/lib
}
