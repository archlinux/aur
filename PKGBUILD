# Maintainer: Bert Peters <bert@bertptrs.nl>
# Previously: Jonathan Schaeffer <Joschaeffer@gmail.com>

pkgname=trang
_pkgname=jing-trang
pkgver=20220510
pkgrel=1
pkgdesc="Converts between different schema languages for XML"
url="https://github.com/relaxng/jing-trang"
arch=('any')
license=('custom')
depends=(java-runtime bash)
validpgpkeys=('D4875856415E63964D87445187D17477BC3A4B95')
source=(
	"https://github.com/relaxng/${_pkgname}/releases/download/V${pkgver}/${pkgname}-${pkgver}.zip"{,.asc}
	trang
)

# Upstream provides sha1sums, so that's what we use.
sha1sums=('386d43b5c141c27bcc3bd44ccb91fe209aedaa16'
          'SKIP'
          '12e0dc12ff808162eb8bcedde3b55b3e5ea4119a')

package() {
	cd "$srcdir/${pkgname}-${pkgver}"

	install -D -m644 trang.jar "${pkgdir}/usr/share/java/${pkgname}/trang.jar"
	install -D -m644 copying.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -D -m644 trang-manual.html "${pkgdir}/usr/share/doc/${pkgname}/trang-manual.html"
	install -D -m755 "${srcdir}/trang" "${pkgdir}/usr/bin/trang"
}
