# Maintainer : ziggi <xziggix@gmail.com>
pkgname='zalc'
pkgver=1.2.4
pkgrel=2
pkgdesc='A small, FLTK-based calculator'
arch=('i686' 'x86_64')
url='http://ziggi.org/category/developments/zalc/'
license=('GPLv3')
depends=('fltk')
provides=('zalc')
source=("https://github.com/ziggi/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=("eb4bfd74884cc8205324fdbdcbf7cbae")

build () {
	cd $srcdir/$pkgname-$pkgver/
	./configure
	make
}
package() {
	cd "${srcdir}/${pkgname}-${pkgver}/src/"
	mkdir -p "${pkgdir}/usr/bin"
	mkdir -p "${pkgdir}/usr/share"
	mkdir -p "${pkgdir}/usr/share/applications"
	mkdir -p "${pkgdir}/usr/share/pixmaps"
	cp zalc "${pkgdir}/usr/bin/"
	cd "${srcdir}/${pkgname}-${pkgver}/"
	cp zalc.desktop "${pkgdir}/usr/share/applications/"
	cp zalc.png "${pkgdir}/usr/share/pixmaps/"
	
	chmod 0755 "${pkgdir}/usr/bin"
	chmod 0755 "${pkgdir}/usr/bin/zalc"
}
