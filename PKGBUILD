# Maintainer: Marie Ramlow <me@nycode.dev>
pkgname=mcserv
pkgver=0.0.6
pkgrel=1
pkgdesc="CLI utility to manage MC server installations."
arch=('x86_64')
url="https://github.com/DRSchlaubi/mcserv"
license=('GPL3')
options=(!strip)
source=("https://github.com/DRSchlaubi/mcserv/releases/download/v$pkgver/$pkgname-$pkgver-linux.tar.gz")
sha256sums=("4c2f574decd8457e20ae9c990575de2a8091f00c88e3732bc2175b55594a399c")

package() {
	cd "$srcdir"
	mkdir -p "${pkgdir}/opt/${pkgname}" "${pkgdir}/usr/bin"
	rm $pkgname-$pkgver-linux.tar.gz
	cp $srcdir/* ${pkgdir}/opt/${pkgname}/
	chmod 755 "${pkgdir}/opt/${pkgname}/mcserv"
	ln -s "/opt/${pkgname}/mcserv" "${pkgdir}/usr/bin/${pkgname}"
}
