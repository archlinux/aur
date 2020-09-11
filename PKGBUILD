# Maintainer: Marius Lindvall <(firstname) {cat} varden {dog} info>

pkgname=mazespheres-bin
pkgver=1.1
pkgrel=5
pkgdesc='A horror-themed minimalistic maze game'

url='https://varden.info/product.php?sid=27'
arch=('x86_64')
license=('custom')

depends=('gcc-libs' 'glib2' 'gtk2' 'pango' 'cairo' 'freetype2' 'fontconfig')
optdepends=()
conflicts=()
source=("Mazespheres-Linux-v1.1.tar.xz::https://varden.info/download.php?sid=27"
	"LICENSE"
	"mazespheres.sh")
sha256sums=("180dbe7369e6116d000698e2d3e77b8a3913bface1f21db6f59cdf689998a3d2"
	"6e6947f62834633c57db9a745a21d290a54bbfc17609e7d2233d892b4c0263b1"
	"3b698333e28f1cff1703e2109abc425228163c06339ed18794e8422931751c48")

DLAGENTS=("https::/usr/bin/env curl -o %o -d IAgreeToTheTermsForThisSoftware=on")

package() {
	cd "$srcdir"
	mkdir -p "$pkgdir/opt/Mazespheres"
	mv Mazespheres_Linux.x86_64 Mazespheres_Linux_Data "$pkgdir/opt/Mazespheres"
	install -Dm 755 "mazespheres.sh" "$pkgdir/usr/bin/mazespheres"
	install -Dm 644 "LICENSE" "$pkgdir/usr/share/licenses/mazespheres-bin/LICENSE"
}
