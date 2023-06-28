# Maintainer: 305a385 <lotsof@shitposting.expert>


pkgname='ytfind'
pkgver='1.4'
pkgrel=0
pkgdesc="A program that searches invidious and gives you video titles and IDs"
arch=('x86_64')
url='https://codeberg.org/305a385/ytfind/'
license=('AGPL3')
depends=('curl')
makedepends=('json-c')
source=("https://codeberg.org/305a385/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('2263ad2d894476fc52137a43d7ca85aaf4cb708daefe7992fff9fda5c7f9c4ad64c71c7017c40a5d344cfc5ffb3c113e24124a7561cd13a9bdd4a599a920f888')

build(){
	cd "$pkgname";
	make build
}

package() {
	mkdir -p "${pkgdir}/usr/bin"
	mkdir -p "${pkgdir}/usr/share/man/man1"

	install -m 755 ${srcdir}/$pkgname/${pkgname} ${pkgdir}/usr/bin/${pkgname}
	install -g 0 -o 0 -m 0644 ${srcdir}/$pkgname/manpages/${pkgname}.1 ${pkgdir}/usr/share/man/man1/
	gzip ${pkgdir}/usr/share/man/man1/${pkgname}.1
}
