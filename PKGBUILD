pkgname=kisslicer
pkgver=1.6.3
pkgrel=4
pkgdesc="KISSlicer is a fast, easy-to-use, cross-platform program that takes 3D files (STL) and generates path information (G-code) for a 3D Printer.  The FREE version has all the features needed for the hobbyist who uses a single-head machine."
arch=('i686' 'x86_64')
url="http://www.kisslicer.com/index.html"
license=('custom')
depends=(
	'libx11'
	'libgl'
)

conflicts=('kisslicer')
provides=('kisslicer')

# Sources
source=(
	"$pkgname.desktop"
	"$pkgname.sh"
	"$pkgname.png"
)
source_i686=('http://www.kisslicer.com/uploads/1/5/3/8/15381852/kisslicer_linux32_1.6.3_release.zip')
source_x86_64=('http://www.kisslicer.com/uploads/1/5/3/8/15381852/kisslicer_linux64_1.6.3_release.zip')
# Checksums
sha256sums=('be805f3f422f9e764cb83492f9ecf4f9f854f9e6027c970baa9b6b07dfcb1d30'
            '3708d511e97c78d78d3ba423875a03a5a808b3f0e28da620700376b84e53500a'
	    '17ec56ab667fc601b5282c8093e795cc65c6c73df25fdafd8ddd96436ea24589'
	   )
sha256sums_i686=('50be1299bac9a55e1fb42c22b93d1978baf76a2fe976148974a3a47ae5b60c33')
sha256sums_x86_64=('def3d429973ca5c6eeee037846369c9e30e130b968a556b7ffe59aaa4993e9ea')

package() {

	cd "$srcdir/"

	# Creating needed directories
	install -dm755 "$pkgdir/opt/kisslicer/"

	# Program
	install -Dm755 "$srcdir/KISSlicer" "$pkgdir/opt/kisslicer/KISSlicer"
	install -Dm755 "$srcdir/$pkgname.png" "$pkgdir/opt/kisslicer/KISSlicer.png"
	install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname.sh"

	# Desktop launcher
	install -Dm755 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/kisslicer.desktop"
}
