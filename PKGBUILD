# Maintainer : Brian Bidulock <bidulock@openss7.org>
pkgname='zalc'
pkgver=1.2.5
pkgrel=3
pkgdesc='A small, FLTK-based calculator'
arch=('i686' 'x86_64')
url='https://ziggi.org/category/developments/zalc/'
license=('GPL3')
depends=('fltk')
makedepends=('cmake')
provides=('zalc')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ziggi/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('32416f71c1fb24a35730f70d4a875c1ae5ac916305dc43196274dcab75a4f1ab017be09bd3965e5972bc1dbbf145740716d5c83280b24a5b0dc3cc1b85047168')

build () {
	cd ${pkgname}-${pkgver}
	cmake -DCMAKE_INSTALL_PREFIX=/usr
	make
}
package() {
	cd ${pkgname}-${pkgver}
	install -Dm0755 zalc "${pkgdir}/usr/bin/zalc"
	install -Dm0644 zalc.desktop "${pkgdir}/usr/share/applications/zalc.desktop"
	install -Dm0644 zalc.png "${pkgdir}/usr/share/pixmaps/zalc.png"
}
