# Maintainer: Joan Moreau <jom@grosjo.net>
pkgname=tomboy-reborn-bin
pkgver=1.0.beta5
pkgrel=2
pkgdesc="A drop-in, straightforward, replacement of deprecated, but extremely usefull, Gnome Tomboy"
arch=('x86_64')
license=('LGPL')
url="https://github.com/grosjo/tomboy-reborn"
depends=(libcanberra)
makedepends=()
optdepends=()
source=( "https://github.com/grosjo/tomboy-reborn/releases/download/${pkgver}/tomboy-reborn_${pkgver}-${pkgrel}_amd64.deb" )
sha256sums=( "8570fbccbb50dc3890efe9d1a89697cb4e87d03f23c8c4daa51708c3daa82a99" )

package() {
	_src="$srcdir/$pkgname"
	mkdir -p "$_src"
	cd $_src
	tar -xf "$srcdir/data.tar.xz"

	cp -r "./usr/share" "$pkgdir/usr/"
	install -Dm755 "usr/bin/tomboy-reborn" "$pkgdir/usr/bin/tomboy-reborn"
}
