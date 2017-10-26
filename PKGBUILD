pkgname=kisslicer
pkgver=1.6.2
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
source_i686=('http://www.kisslicer.com/uploads/1/5/3/8/15381852/kisslicer_linux32_1.6.2_release.zip')
source_x86_64=('http://www.kisslicer.com/uploads/1/5/3/8/15381852/kisslicer_linux64_1.6.2_release.zip')
# Checksums
sha256sums=('be805f3f422f9e764cb83492f9ecf4f9f854f9e6027c970baa9b6b07dfcb1d30'
            '4f1ed6611ec0dce746f6c360a7f2b7643feeede3678614624b7e15209c325be6'
	    '17ec56ab667fc601b5282c8093e795cc65c6c73df25fdafd8ddd96436ea24589'
	   )
sha256sums_i686=('73167e9948f083b18219481fe72d69b9a9117dc6623923a7a7f1a18cadf0c7d6')
sha256sums_x86_64=('c4b60e9d0444196f7a57a2bcec97a7ea7d8c646ff787018ed1067cc93d1b4fa9')

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
