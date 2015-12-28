# Maintainer: Daniel Landau <daniel.landau@iki.fi>
pkgname=shrinkpdf
pkgver=1.0
pkgrel=3
pkgdesc="Tiny shell script to shrink an image pdf"
arch=('any')
url="http://www.alfredklomp.com/programming/shrinkpdf/"
license=('BSD')
depends=('ghostscript')
source=(
http://www.alfredklomp.com/programming/shrinkpdf/shrinkpdf.sh
)
sha256sums=('d68561bd674847d6b73961af571adf5720c9b525720afc399c3f7324d7af638f')

package() {
	cd "$srcdir/"

	sed -ne '/Copyright/,/POSSIBILITY OF SUCH DAMAGE/p' shrinkpdf.sh > LICENSE
	install -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	install -D shrinkpdf.sh "$pkgdir/usr/bin/shrinkpdf.sh"
}

