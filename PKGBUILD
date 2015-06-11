# Maintainer: Ray Hogenson <rayhogenson@gmail.com>
pkgname=par
pkgver=1.52
pkgrel=4
pkgdesc="Paragraph reformatter"
url="http://www.nicemice.net/par/"
depends=('glibc')
arch=(i686 x86_64)
license=('custom')
source=(http://www.nicemice.net/par/Par152.tar.gz)
md5sums=('4ccacd824171ba2c2f14fb8aba78b9bf')
_dirname="Par152"

prepare() {
	cd "$_dirname"
}
build() {
	cd "$_dirname"
	make -f protoMakefile
}
package() {
	cd "$_dirname"
	install --mode=755 -D par "$pkgdir/usr/bin/par"
	install --mode=644 -D par.1 "$pkgdir/usr/share/man/man1/par.1"
	install --mode=644 -D par.doc "$pkgdir/usr/share/licenses/$pkgname/par.doc"
}

