pkgname=kisslicer
pkgver=1.6
pkgrel=1
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
source_i686=('http://www.kisslicer.com/uploads/1/5/3/8/15381852/kisslicer_linux32_1.6_release.zip')
source_x86_64=('http://www.kisslicer.com/uploads/1/5/3/8/15381852/kisslicer_linux64_1.6_release.zip')
# Checksums
sha256sums=('be805f3f422f9e764cb83492f9ecf4f9f854f9e6027c970baa9b6b07dfcb1d30'
            '4f1ed6611ec0dce746f6c360a7f2b7643feeede3678614624b7e15209c325be6'
	    '17ec56ab667fc601b5282c8093e795cc65c6c73df25fdafd8ddd96436ea24589'
	   )
sha256sums_i686=('1a0205b470698783a675990bfe733c349d6e9343a8ea64f3ef73859d5cb7633f')
sha256sums_x86_64=('786729e18db5ffa54a70bbaf09b7868ecec893918e7df6c5bba0714196fe4ce0')

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
