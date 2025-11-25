# Maintainer: p0358 <>
# Contributor: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=libuncso2-bin
pkgver=1.2.0
pkgrel=3
pkgdesc="Backend for UnCSO2 (binary release)"
url="https://github.com/harmonytf/libuncso2"
_upstream_app_url="https://github.com/harmonytf/UnCSO2"
_upstream_app_ver=2.1.1
license=(GPL-3.0-only)
arch=(x86_64)
provides=("libuncso2=$pkgver")
conflicts=(libuncso2)
source=("$_upstream_app_url/releases/download/v$_upstream_app_ver/UnCSO2-$_upstream_app_ver-linux-$CARCH-gcc-install.zip")
sha256sums=('61634836a9a5ca702b486a52797cb8bdadf4b9824c8f9faf28c5a7e8cd487cb5')

package() {
	# We are using a common app+lib package source, only extract libuncso2 stuff
	mkdir -p "$pkgdir/usr/share/licenses"
	cp -a --reflink=auto "$srcdir/include" "$pkgdir/usr/"
	cp -a --reflink=auto "$srcdir/lib" "$pkgdir/usr/"
	cp -a --reflink=auto "$srcdir/share/licenses/libuncso2" "$pkgdir/usr/share/licenses/"
}
