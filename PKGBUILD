# Contributor: kusakata <shohei atmark kusakata period com>
# Contributor: Pablo Lezaeta <prflr88 (arro'a) gmail.com>

pkgname=apngopt
pkgver=1.4
pkgrel=1
pkgdesc="Optimizes existing APNG animation"
arch=("i686" "x86_64")
url="http://sourceforge.net/projects/apng/files/APNG_Optimizer/"
license=("zlib")
source=("http://downloads.sourceforge.net/project/apng/APNG_Optimizer/${pkgver}/apngopt-${pkgver}-src.zip")

build() {
	cd "${srcdir}"
	make DESTDIR="${pkgdir}" prefix=/usr sbindir=/usr/bin bindir=/usr/bin libdir=/usr/lib
}

package() {
	cd "${srcdir}"
	#make DESTDIR="${pkgdir}" prefix=/usr sbindir=/usr/bin bindir=/usr/bin libdir=/usr/lib install 
	install -Dm755 "${srcdir}/apngopt" "${pkgdir}/usr/bin/apngopt"
}

md5sums=('cb214b0b30b9b89ac25f41fb84ca5559')
