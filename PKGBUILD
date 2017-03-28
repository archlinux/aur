# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Jestine Paul <jestine dot paul at gmail dot com>
pkgname=libcs50
pkgver=7.1.2
pkgrel=1
epoch=
pkgdesc="CS50 Library for C (Harvard course)"
arch=('x86_64' 'i686')
url="https://cs50.harvard.edu/"
license=('unknown')
groups=()
depends=('glibc')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=('lib50-c-git' 'lib50-c')
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/cs50/lib50-c/archive/$pkgver.tar.gz")
noextract=()
md5sums=('bab3f9a12a19ee799e5e1461c08d7117')
validpgpkeys=()

build() {
	cd "lib50-c-$pkgver"
	make build
}

package() {
	install -dm755 "$pkgdir/"{usr/include,usr/lib,usr/share/man/man3}
	install -Dm644 "$srcdir/lib50-c-$pkgver/build/usr/lib/libcs50.so" "$pkgdir/usr/lib/libcs50.so"
	install -Dm644 "$srcdir/lib50-c-$pkgver/build/usr/include/cs50.h" "$pkgdir/usr/include/cs50.h"

	install -Dm644 "$srcdir/lib50-c-$pkgver/build/usr/share/man/man3/eprintf.3" "$pkgdir/usr/share/man/man3/eprintf.3"
	install -Dm644 "$srcdir/lib50-c-$pkgver/build/usr/share/man/man3/get_char.3" "$pkgdir/usr/share/man/man3/get_char.3"
	install -Dm644 "$srcdir/lib50-c-$pkgver/build/usr/share/man/man3/get_double.3" "$pkgdir/usr/share/man/man3/get_double.3"
	install -Dm644 "$srcdir/lib50-c-$pkgver/build/usr/share/man/man3/get_float.3" "$pkgdir/usr/share/man/man3/get_float.3"
	install -Dm644 "$srcdir/lib50-c-$pkgver/build/usr/share/man/man3/get_int.3" "$pkgdir/usr/share/man/man3/get_int.3"
	install -Dm644 "$srcdir/lib50-c-$pkgver/build/usr/share/man/man3/get_long_long.3" "$pkgdir/usr/share/man/man3/get_long_long.3"
	install -Dm644 "$srcdir/lib50-c-$pkgver/build/usr/share/man/man3/get_string.3" "$pkgdir/usr/share/man/man3/get_string.3"
}
