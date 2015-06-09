# Maintainer: t3kk3n <corp [at] hush [dot] ai>

pkgname=fatx
pkgver=1.9
pkgrel=2
pkgdesc="XBox filesystem support for linux"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/fatx/"
license=('GPL')
provides=($pkgname)
depends=('fuse' 'boost' 'boost-libs')
source=("http://downloads.sourceforge.net/project/fatx/${pkgname}_${pkgver}.orig.tar.gz")
sha256sum=('0e0203fce77b28101437265de9bf52bd113cb51658b9af45761a368bbeb1aa4c')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr --sbindir=/usr/bin
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="$pkgdir/" install
}
