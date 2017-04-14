# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
pkgname='mongodb-compass-beta'
pkgver=1.7.0beta.1
_pkgver=1.7.0-beta.1
pkgrel=2
pkgdesc='The official GUI for MongoDB (beta version)'
arch=('x86_64')
url='https://www.mongodb.com/products/compass'
license=('custom')
depends=('nss' 'gconf' 'libxtst' 'alsa-lib' 'gtk2' 'libsecret' 'gcc-libs-multilib' 'libxss')
source=("https://downloads.mongodb.com/compass/beta/$pkgname-$_pkgver.$arch.rpm")
md5sums=('4d63b794e0bdde2c1faa2813762ce807')

package() {
	rm -r "$srcdir/usr/share/doc/"
	mkdir -p "$srcdir/usr/share/licenses/$pkgname"
	mv "$srcdir/usr/share/$pkgname/LICENSE" "$srcdir/usr/share/licenses/$pkgname"
	mv "$srcdir/usr/share/$pkgname/LICENSES.chromium.html" "$srcdir/usr/share/licenses/$pkgname"
	mv "$srcdir/usr/share/pixmaps/" "$srcdir/usr/share/icons/"

	mv "$srcdir/usr/" "$pkgdir/usr/"
}
