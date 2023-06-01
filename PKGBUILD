# Maintainer: 305a385 <lotsof@shitposting.expert>


pkgname='ytfind'
pkgver='1.3'
pkgrel=2
pkgdesc="A program that searches invidious and gives you video titles and IDs"
arch=('x86_64')
url='https://github.com/305a385/ytfind/'
license=('AGPL3')
depends=('curl')
makedepends=('json-c')
source=("https://github.com/305a385/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b00049ba360e5d24652b911c0b7e8ce9be255b799ead0e2274e116f8140af600')

build(){
	cd "$pkgname-$pkgver";
	make build
}

package() {

	mkdir -p "${pkgdir}/usr/bin"
	mkdir -p "${pkgdir}/usr/share/man/man1"

	install -m 755 ${srcdir}/$pkgname-$pkgver/${pkgname} ${pkgdir}/usr/bin/${pkgname}
	install -g 0 -o 0 -m 0644 ${srcdir}/$pkgname-$pkgver/manpages/${pkgname}.1 ${pkgdir}/usr/share/man/man1/
	gzip ${pkgdir}/usr/share/man/man1/${pkgname}.1
}
