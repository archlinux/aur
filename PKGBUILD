# Maintainer: 305a385 <lotsof@shitposting.expert>


pkgname='ytfind'
pkgver='1.3'
pkgrel=1
pkgdesc="A program that searches invidious and gives you video titles and IDs"
arch=('x86_64')
url='https://github.com/305a385/ytfind/'
license=('AGPL3')
depends=('curl')
makedepends=('git')
binname=('GNU-Linux-x86_64')
source=("https://github.com/305a385/$pkgname/releases/download/v$pkgver/$binname"
	"https://github.com/305a385/$pkgname/releases/download/v$pkgver/${pkgname}.1")
sha256sums=('5425960f70d58abd00832a0c1bd5b258b2b17a90b518af260597e4efe3ee2657'
	'SKIP')
noextract=('ytfind')
package() {
	mkdir -p "${pkgdir}/usr/bin"
	mkdir -p "${pkgdir}/usr/local/man/man1"

	install -m 755 ${srcdir}/${binname} ${pkgdir}/usr/bin/${pkgname}
	install -g 0 -o 0 -m 0644 ${srcdir}/${pkgname}.1 ${pkgdir}/usr/local/man/man1/
	gzip ${pkgdir}/usr/local/man/man1/${pkgname}.1
}
