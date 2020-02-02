# Maintainer : ziggi <xziggix@gmail.com>
pkgname='zalc'
pkgver=1.2.5
pkgrel=2
pkgdesc='A small, FLTK-based calculator'
arch=('i686' 'x86_64')
url='https://ziggi.org/category/developments/zalc/'
license=('GPLv3')
depends=('fltk')
provides=('zalc')
source=("https://github.com/ziggi/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('32416f71c1fb24a35730f70d4a875c1ae5ac916305dc43196274dcab75a4f1ab017be09bd3965e5972bc1dbbf145740716d5c83280b24a5b0dc3cc1b85047168')

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
