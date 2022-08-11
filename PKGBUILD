# Maintainer: Daniel Landau <daniel.landau@iki.fi>
pkgname=shrinkpdf
pkgver=1.1
pkgrel=1
pkgdesc="Tiny shell script to shrink an image pdf"
arch=('any')
url="https://github.com/aklomp/shrinkpdf"
license=('BSD')
depends=('ghostscript')
source=(
https://github.com/aklomp/shrinkpdf/archive/refs/tags/v${pkgver}.tar.gz
)
sha256sums=('e02cd491c6f7abbc5c129227dbcfe5257fc9a18b40129af29967be1542cddaaa')

package() {
	cd "$srcdir/$pkgname-$pkgver"

	sed -ne '/Copyright/,/POSSIBILITY OF SUCH DAMAGE/p' shrinkpdf.sh > LICENSE
	install -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	install -D shrinkpdf.sh "$pkgdir/usr/bin/shrinkpdf.sh"
	install -D shrinkpdf.sh "$pkgdir/usr/bin/shrinkpdf"
}

