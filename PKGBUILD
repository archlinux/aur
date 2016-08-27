# Maintainer: koneu <koneu93 at googlemail dot com>

pkgname="xrootconsole"
pkgver="0.6"
pkgrel=1
pkgdesc="display a file (or stdin) to a transparent window"
url="https://sourceforge.net/projects/xrootconsole"
license=("GPL2")
source=("http://downloads.sourceforge.net/project/xrootconsole/xrootconsole/${pkgver}/xrootconsole-${pkgver}.tar.gz" "make.patch")
depends=("libx11")
arch=("i686" "x86_64")
md5sums=('c3570d420eb5ae9f98385bc48c636fc4'
         '8b122de1813ba3ca94889739c5373692')

build() {
	cd "${pkgname}-${pkgver}"
	patch -p1 < ${srcdir}/make.patch
	make
}

package() {
	cd "${pkgname}-${pkgver}"
	PREFIX=${pkgdir}/usr make install
}
