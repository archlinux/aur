# Maintainer: Joan Moreau <jom@grosjo.net>
pkgname=tomboy-reborn-bin
pkgver=1.0
pkgrel=4
_pkgstate=beta
pkgdesc="A drop-in, straightforward, replacement of deprecated, but extremely usefull, Gnome Tomboy"
arch=('x86_64')
license=('LGPL')
url="https://github.com/grosjo/tomboy-reborn"
depends=(libcanberra)
makedepends=()
optdepends=()
source=( "https://github.com/grosjo/tomboy-reborn/releases/download/${pkgver}-${_pkgstate}${pkgrel}/tomboy-reborn_${pkgver}-${_pkgstate}${pkgrel}_amd64.deb" )
sha256sums=( "d31b02d040c982e79474dd7ccf610b1da47b61c108597ce4b22b984ec6ca1d39" )

package() {
	_src="$srcdir/$pkgname"
	mkdir -p "$_src"
	cd $_src
	tar -xvf "$srcdir/data.tar.xz"

	cp -vr "./usr/share" "$pkgdir/usr/"
	install -Dm755 "usr/bin/tomboy-reborn" "$pkgdir/usr/bin/tomboy-reborn"
}
