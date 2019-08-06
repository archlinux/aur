# Maintainer: Daniel Landau <daniel.landau@iki.fi>
pkgname=shrinkpdf
pkgver=1.0
pkgrel=5
pkgdesc="Tiny shell script to shrink an image pdf"
arch=('any')
url="http://www.alfredklomp.com/programming/shrinkpdf/"
license=('BSD')
depends=('ghostscript')
source=(
http://www.alfredklomp.com/programming/shrinkpdf/shrinkpdf.sh
)
sha256sums=('2aa47759a945165e119b84b99d1042c63fceb1ec2692145e250b4f78ec032662')

package() {
	cd "$srcdir/"

	sed -ne '/Copyright/,/POSSIBILITY OF SUCH DAMAGE/p' shrinkpdf.sh > LICENSE
	install -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	install -D shrinkpdf.sh "$pkgdir/usr/bin/shrinkpdf.sh"
	install -D shrinkpdf.sh "$pkgdir/usr/bin/shrinkpdf"
}

