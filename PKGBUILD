pkgname=kisslicer
pkgver=1.5
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
)
source_i686=('http://www.kisslicer.com/files/150/KISSlicer_Linux32_'$pkgver'_Release.zip')
source_x86_64=('http://www.kisslicer.com/files/150/KISSlicer_Linux64_'$pkgver'_Release.zip')
# Checksums
sha256sums=('be805f3f422f9e764cb83492f9ecf4f9f854f9e6027c970baa9b6b07dfcb1d30'
            '4f1ed6611ec0dce746f6c360a7f2b7643feeede3678614624b7e15209c325be6'
	   )
sha256sums_i686=('7e9fae1ba61746d66da45e82f49902e1f5048dcc93fe48c70fc81961925f3b42')
sha256sums_x86_64=('87e7a32144090c80c87c32234aab3cd0de4704adfd9ca731b0104e576dc85b4a')

package() {

	cd "$srcdir/"

	# Creating needed directories
	install -dm755 "$pkgdir/opt/kisslicer/"

	# Program
	install -Dm755 "$srcdir/KISSlicer" "$pkgdir/opt/kisslicer/KISSlicer"
	install -Dm755 "$srcdir/KISSlicer.png" "$pkgdir/opt/kisslicer/KISSlicer.png"
	install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname.sh"

	# Desktop launcher
	install -Dm755 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/kisslicer.desktop"
}
