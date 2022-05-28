# Maintainer: Marie Ramlow <me@nycode.dev>
pkgname=mcserv
pkgver=0.1.3
pkgrel=1
pkgdesc="CLI utility to manage MC server installations."
arch=('x86_64')
url="https://github.com/DRSchlaubi/mcserv"
license=('GPL3')
options=(!strip)
source=("https://github.com/DRSchlaubi/mcserv/releases/download/v$pkgver/$pkgname-$pkgver-linux.tar.gz")
sha256sums=("78695bec7000d37334437b27a943c55c4daff34142d124a2ec391534fc329475")

package() {
	cd "$srcdir"
	mkdir -p "${pkgdir}/opt/${pkgname}" "${pkgdir}/usr/bin"
	rm $pkgname-$pkgver-linux.tar.gz
	cp $srcdir/* ${pkgdir}/opt/${pkgname}/
	chmod 755 "${pkgdir}/opt/${pkgname}/mcserv"
	ln -s "/opt/${pkgname}/mcserv" "${pkgdir}/usr/bin/${pkgname}"
}
