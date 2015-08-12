# Maintainer: t3kk3n <corp [at] hush [dot] ai>

pkgname=fatx
pkgver=1.9
pkgrel=3
pkgdesc="XBox filesystem support for linux"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/fatx/"
license=('GPL')
provides=($pkgname)
depends=('fuse' 'boost' 'boost-libs')
source=("http://downloads.sourceforge.net/project/fatx/${pkgname}_${pkgver}.orig.tar.gz")
sha256sum=('d4884e23b3dcc59c1d17e653417b3169069ddc8cbed1205613c9b0889d6f89c4')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr --sbindir=/usr/bin
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="$pkgdir/" install
}
