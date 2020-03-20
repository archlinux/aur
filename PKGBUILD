# Contributor: Auguste Pop <auguste [at] gmail [dot] com>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=popeye-chess
pkgver=4.69
pkgrel=1
pkgdesc="A chess problem solving and testing software with strong support for fairy chess and heterodox genres."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/popeye-chess/"
license=('GPL2')
source=("http://downloads.sourceforge.net/project/${pkgname}/Popeye/${pkgver}/${pkgname%-*}-${pkgver}-sources.zip")
md5sums=('507191b2d95f5937c112541b92f10c26')
sha1sums=('95e900d3e6f4e158beccfd6f703b7111701185cd')
sha256sums=('13e13fa409afd4e5c899de9a73b5f8f1ef44f9bb14400cbb19a0c76391c52601')

build() {
	cd "$srcdir/$pkgver"
	CFLAGS="$CFLAGS -march=native -mtune=native" make -f makefile.unx
}

package() {
	cd "$srcdir/$pkgver"
	install -D -m755 py "$pkgdir/usr/bin/py"
	install -d "$pkgdir/usr/share/doc/${pkgname%-*}"
	install -m 644 py-*.txt "$pkgdir/usr/share/doc/${pkgname%-*}"
}
