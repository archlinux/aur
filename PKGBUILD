# Contributor: Daniel Landau <daniel.landau@iki.fi>
# Maintainer: Pedro Henrique Quitete Barreto <pedrohqb@gmail.com>
pkgname=shrinkpdf
pkgver=1.2
pkgrel=3
pkgdesc="Tiny shell script to shrink an image pdf"
arch=('any')
url="https://github.com/aklomp/shrinkpdf"
license=('BSD-3-Clause')
depends=('ghostscript')
source=(
https://github.com/aklomp/shrinkpdf/archive/refs/tags/v${pkgver}.tar.gz
)
sha256sums=('8040ee876411fdcfe8e74040f700dcf4fc2844a7e6f29c5041e8e73c34af9cd0')

package() {
	cd "$srcdir/$pkgname-$pkgver"

	sed -ne '/Copyright/,/POSSIBILITY OF SUCH DAMAGE/p' shrinkpdf.sh > LICENSE
	install -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	install -D shrinkpdf.sh "$pkgdir/usr/bin/shrinkpdf"
}
