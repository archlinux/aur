# Maintainer: t3kk3n <corp [at] hush [dot] ai>

pkgname=fatx
pkgver=1.14
pkgrel=1
pkgdesc="XBox filesystem support for linux"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/fatx/"
license=('GPL')
provides=($pkgname)
depends=('fuse' 'boost' 'boost-libs')
source=("http://downloads.sourceforge.net/project/fatx/${pkgname}-${pkgver}.tar.gz")
sha256sums=('7fc2a877267218eaabc4a16318371774e85dfdc2c8d2962ce984c87146e81a4e')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr --sbindir=/usr/bin
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="$pkgdir/" install
}
