# Maintainer: gardar <aur@gardar.net>

pkgname=cramfsswap
pkgver=1.4.2
pkgrel=1
pkgdesc="swap endianess of a cram filesystem (cramfs)"
url="https://github.com/julijane/$pkgname"
arch=('i686' 'x86_64')
license=('GPL')
depends=('zlib')
options=('!buildflags' '!makeflags')
source=("http://deb.debian.org/debian/pool/main/c/$pkgname/${pkgname}_${pkgver//_/-}.tar.xz")
sha256sums=('81cfa870c57df176bf279be09d2febc1fae3887901b54087523686d37f21b282')

build() {
	cd $srcdir/$pkgname-${pkgver%%_*}
	make
}

package() {
	install -Dm644 "$srcdir/$pkgname-${pkgver%%_*}/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "$srcdir/$pkgname-${pkgver%%_*}/$pkgname.1" "$pkgdir/usr/share/man/man1/$pkgname.1"
	install -Dm755 "$srcdir/$pkgname-${pkgver%%_*}/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
