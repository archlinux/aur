pkgname=kisslicer2
pkgver=23.05
pkgrel=1
pkgdesc="KISSlicer is a fast, easy-to-use, cross-platform program that takes 3D files (STL) and generates path information (G-code) for a 3D Printer.  The FREE version has all the features needed for the hobbyist who uses a single-head machine. Alpha version of V2"
arch=('x86_64')
url="http://www.kisslicer.com/index.html"
license=('custom')
depends=(
	'libx11'
	'libgl'
)

conflicts=('kisslicer2')
provides=('kisslicer2')

# Sources
source=(
	"$pkgname.desktop"
	"$pkgname.sh"
	"$pkgname.png"
)
#source_i686=('') # No i686 build for linux since 2.0.6
source_x86_64=('https://www.kisslicer.com/uploads/1/5/3/8/15381852/kisslicer_linux_v23.05.zip')
# Checksums
sha256sums=('dcc2f0c110fc71e35a6a0e8aad8e375bfd4eb09db309fafa517b2857d600b6c6'
            '9f6bbb2357f2f81cfeb86f8f114b4e529c9f9f52a551fc5bca16a679ce60245b'
            '17ec56ab667fc601b5282c8093e795cc65c6c73df25fdafd8ddd96436ea24589')
sha256sums_x86_64=('24c904c03ef8dadbcd4d23b9c955d3d54fd1792e11c29fdf58a7fc5b312f0dbe')
#sha256sums_i686=('SKIP')

package() {

	cd "$srcdir/"

	# Program
	install -Dm755 "$srcdir/KISSlicer" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "$srcdir/$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
	install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname.sh"

	# Desktop launcher
	install -Dm755 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
