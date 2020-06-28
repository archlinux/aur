# Maintainer: Joan Moreau <jom@grosjo.net>
pkgname=tomboy-reborn-bin
pkgver=1.0.beta6
pkgrel=1
pkgdesc="A drop-in, straightforward, replacement of deprecated, but extremely usefull, Gnome Tomboy"
arch=('x86_64')
license=('LGPL')
url="https://github.com/grosjo/tomboy-reborn"
depends=(libcanberra)
makedepends=()
optdepends=()
source=( "https://github.com/grosjo/tomboy-reborn/releases/download/${pkgver}/tomboy-reborn_${pkgver}-${pkgrel}_amd64.deb" )
sha256sums=( "3b246d3717b23f9e936d058c930283d130877358742173712ad9a0317a32c6fc" )

package() {
	_src="$srcdir/$pkgname"
	mkdir -p "$_src"
	cd $_src
	tar -xf "$srcdir/data.tar.xz"

	cp -r "./usr/share" "$pkgdir/usr/"
	install -Dm755 "usr/bin/tomboy-reborn" "$pkgdir/usr/bin/tomboy-reborn"
}
