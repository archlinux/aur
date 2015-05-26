# Contributor: kusakata <shohei atmark kusakata period com>
# Contributor: Pablo Lezaeta <prflr88 (arro'a) gmail.com>

pkgname=apngopt
pkgver=1.3
pkgrel=1
pkgdesc="Optimizes existing APNG animation"
arch=("i686" "x86_64")
url="http://sourceforge.net/projects/apng/files/APNG_Optimizer/"
license=("zlib")
source=("http://downloads.sourceforge.net/project/apng/APNG_Optimizer/${pkgver}/apngopt-${pkgver}-src.zip"
	"001-missing-header.patch")

prepare(){
	patch  -p1 < "001-missing-header.patch"
}

build() {
	cd "${srcdir}"
	make DESTDIR="${pkgdir}" prefix=/usr sbindir=/usr/bin bindir=/usr/bin libdir=/usr/lib
}

package() {
	cd "${srcdir}"
	#make DESTDIR="${pkgdir}" prefix=/usr sbindir=/usr/bin bindir=/usr/bin libdir=/usr/lib install 
	install -Dm755 "${srcdir}/apngopt" "${pkgdir}/usr/bin/apngopt"
}

md5sums=('e2d2411ea9a704c5522dbcad482816f1'
         'cde7d050ce06a32956256a2e7ab992be')
