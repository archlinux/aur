# Maintainer: t3kk3n <corp [at] hush [dot] ai>

pkgname=fatx
pkgver=1.13
pkgrel=1
pkgdesc="XBox filesystem support for linux"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/fatx/"
license=('GPL')
provides=($pkgname)
depends=('fuse' 'boost' 'boost-libs')
source=("http://downloads.sourceforge.net/project/fatx/${pkgname}-${pkgver}.tar.gz")
sha256sums=('2a09a84d7d074412a68c73cb2b6a89ebe24451378e99cac97420aff6c7329a8e')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr --sbindir=/usr/bin
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="$pkgdir/" install
}
