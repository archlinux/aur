# Maintainer: Andreas Hauser <andy-aur@splashground.de>
# Former Maintainer: Christoph Drexler <chrdr at gmx dot at>


pkgbase=ffindex
pkgdesc="simple index/database for huge amounts of small files"
pkgver=0.9.9.4
pkgrel=1
url=http://www.splashground.de/~andy/programs/FFindex
arch=i686
arch=x86_64
license=('CCPL:cc-by-sa-3.0')
source=http://www.splashground.de/~andy/programs/FFindex/ffindex-0.9.9.4.tar.gz
sha256sums=f24ec24f6d66878fcc309a3b7ede872ac5ccb5908fd41741ed78d75db3bbb5bb
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
