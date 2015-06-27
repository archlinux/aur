# Maintainer: Daniel Landau <daniel.landau@iki.fi>
pkgname=shrinkpdf
pkgver=1.0
pkgrel=2
pkgdesc="Tiny shell script to shrink an image pdf"
arch=('any')
url="http://www.alfredklomp.com/programming/shrinkpdf/"
license=('BSD')
depends=('ghostscript')
source=(
http://www.alfredklomp.com/programming/shrinkpdf/shrinkpdf.sh
)
sha256sums=('24da8a094964a502fb5999ddedad99fba46e52339900d49be9a8d389a43c339e')

package() {
	cd "$srcdir/"

	sed -ne '/Copyright/,/POSSIBILITY OF SUCH DAMAGE/p' shrinkpdf.sh > LICENSE
	install -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	install -D shrinkpdf.sh "$pkgdir/usr/bin/shrinkpdf.sh"
}

