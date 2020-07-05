# Maintainer: Joan Moreau <jom@grosjo.net>
pkgname=tomboy-reborn-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="A drop-in, straightforward, replacement of deprecated, but extremely usefull, Gnome Tomboy"
arch=('x86_64')
license=('LGPL')
url="https://github.com/grosjo/tomboy-reborn"
depends=(libcanberra)
makedepends=()
optdepends=()
source=( "https://github.com/grosjo/tomboy-reborn/releases/download/${pkgver}/tomboy-reborn_${pkgver}-${pkgrel}_amd64.deb" )
sha256sums=( "fc0281a8ac1001f316a7e17b801b8a70d947b0f97fcf082bef77c11e02e5ecbb" )

package() {
	_src="$srcdir/$pkgname"
	mkdir -p "$_src"
	cd $_src
	tar -xf "$srcdir/data.tar.xz"

	cp -r "./usr/share" "$pkgdir/usr/"
	install -Dm755 "usr/bin/tomboy-reborn" "$pkgdir/usr/bin/tomboy-reborn"
}
