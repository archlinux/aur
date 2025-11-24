# Maintainer: p0358 <>
# Contributor: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=uncso2-bin
pkgver=2.1.1
pkgrel=1
pkgdesc="A file extractor for Counter-Strike: Online 2 and Titanfall Online (binary release)"
url="https://github.com/harmonytf/UnCSO2"
license=(GPL-3.0-only)
arch=(x86_64)
depends=('libuncso2>=1.2.0' qt6-base)
provides=(uncso2)
conflicts=(uncso2)
source=("$url/releases/download/v$pkgver/UnCSO2-$pkgver-linux-$CARCH-gcc-install.zip")
sha256sums=('61634836a9a5ca702b486a52797cb8bdadf4b9824c8f9faf28c5a7e8cd487cb5')

package() {
	# We are using a common app+lib package source, skip extracting libuncso2 stuff
	mkdir -p "$pkgdir/usr"
	cp -a --reflink=auto "$srcdir/bin" "$pkgdir/usr/"
	cp -a --reflink=auto "$srcdir/share" "$pkgdir/usr/"
	rm -rf "$pkgdir/usr/share/licenses/libuncso2"
}
