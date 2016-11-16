# Maintainer: Joermungand <joermungand at gmail dot com>
pkgname=lsp-plugins-lv2-bin
pkgver=1.0.16
pkgrel=1
pkgdesc="Linux Studio Plugins: LV2 format"
arch=('i686' 'x86_64')
url="http://lsp-plug.in"
license=('custom')
depends=('libsndfile' 'gtk2')
optdepends=('lsp-plugins-doc: HTML documentation')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source_i686=("http://downloads.sourceforge.net/project/lsp-plugins/v${pkgver}/${pkgname%-*}-$pkgver-i586.tar.gz")
source_x86_64=("http://downloads.sourceforge.net/project/lsp-plugins/v${pkgver}/${pkgname%-*}-$pkgver-x86_64.tar.gz")
sha1sums_i686=('90081c8e9f647ffa44755ed968d3bad5abd4bc86')
sha1sums_x86_64=('1d3f1c9c79600a8c30602839e46b1940450b25fe')

package() {
	cd $srcdir
	for i in */; do
		cd $i
		for j in */; do
			install -dm755 "$pkgdir/usr/lib/lv2/$j"
			install -Dm755 $j/* "$pkgdir/usr/lib/lv2/$j/"
		done
		install -Dm644 CHANGELOG.txt "$pkgdir/usr/share/doc/${pkgname%-*}/CHANGELOG"
		install -Dm644 README.txt "$pkgdir/usr/share/doc/${pkgname%-*}/README"
		install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
	done
}
