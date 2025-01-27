# Maintainer: gardar <aur@gardar.net>

pkgname=cramfsswap
pkgver=1.4.4
pkgrel=1
pkgdesc="swap endianess of a cram filesystem (cramfs)"
url="https://github.com/julijane/$pkgname"
arch=('i686' 'x86_64')
license=('GPL')
depends=('zlib')
options=('!buildflags' '!makeflags')
source=("http://deb.debian.org/debian/pool/main/c/$pkgname/${pkgname}_${pkgver//_/-}.tar.xz")
sha512sums=('51298e93e267203dc453f2abea91d76eaeb4f775bd901788fc341b2680fdba2685acbb89263b2f5e3df50e8e8e76f2e5c846b68dfbf492d35d7878c2cc247bff')

build() {
	cd $srcdir/$pkgname-salsa
	make
}

package() {
	install -Dm644 "$srcdir/$pkgname-salsa/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "$srcdir/$pkgname-salsa/$pkgname.1" "$pkgdir/usr/share/man/man1/$pkgname.1"
	install -Dm755 "$srcdir/$pkgname-salsa/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
