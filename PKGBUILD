# Maintainer: Daniel Landau <daniel.landau@iki.fi>
pkgname=shrinkpdf
pkgver=1.0
pkgrel=4
pkgdesc="Tiny shell script to shrink an image pdf"
arch=('any')
url="http://www.alfredklomp.com/programming/shrinkpdf/"
license=('BSD')
depends=('ghostscript')
source=(
http://www.alfredklomp.com/programming/shrinkpdf/shrinkpdf.sh
)
sha256sums=('bf313e47e81ce4c088704840554f2f643597db1b3d6937a0af5ed43368b1ccc7')

package() {
	cd "$srcdir/"

	sed -ne '/Copyright/,/POSSIBILITY OF SUCH DAMAGE/p' shrinkpdf.sh > LICENSE
	install -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	install -D shrinkpdf.sh "$pkgdir/usr/bin/shrinkpdf.sh"
	install -D shrinkpdf.sh "$pkgdir/usr/bin/shrinkpdf"
}

