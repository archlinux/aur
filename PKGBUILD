# Maintainer: Maarten de Vries <maarten@de-vri.es>

pkgname=pylon
pkgdesc="Basler camera Software suite"
pkgver=5.0.5.9000.rc8
pkgrel=1
arch=(x86_64)
license=(custom)
url=http://www.baslerweb.com/en/products/software

depends=(qt4)

source=("http://s.baslerweb.com/media/documents/pylon-5.0.5.9000--RC8-$CARCH.tar.gz")
sha512sums=('9554890441a371142d034392df22b6e1daea835fc677b39a0119247dc8245fc0fddd3398a851700bc2179659963d49ecb9955013fa92968f1a22f4144e0edfad')

_dir="pylon-5.0.5.9000-$CARCH"

prepare() {
	cd "$srcdir/$_dir"
	bsdtar -xf "pylonSDK-5.0.5.9000-$CARCH.tar.gz"
}

package() {
	cd "$srcdir/$_dir"

	mkdir -p "$pkgdir/opt"
	cp -a --no-preserve=ownership "$srcdir/$_dir/pylon5"  "$pkgdir/opt/pylon5"
	cp -a --no-preserve=ownership "$srcdir/$_dir/doc"     "$pkgdir/opt/pylon5/doc"
	cp -a --no-preserve=ownership "$srcdir/$_dir/Samples" "$pkgdir/opt/pylon5/samples"
	cp -a --no-preserve=ownership "$srcdir/$_dir/"{README,INSTALL,ReleaseNotes.txt} "$pkgdir/opt/pylon5/"
}
