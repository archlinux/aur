# Maintainer: Joermungand <joermungand at gmail dot com>
pkgname=lsp-plugins-lv2-bin
pkgver=1.1.3
pkgrel=1
pkgdesc="Linux Studio Plugins: LV2 format"
arch=('i686' 'x86_64')
url="http://lsp-plug.in"
license=('custom')
depends=('libsndfile' 'cairo')
optdepends=('lsp-plugins-doc: HTML documentation')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source_i686=("http://downloads.sourceforge.net/project/lsp-plugins/lsp-plugins/${pkgver}/${pkgname%-*}-$pkgver-i586.tar.gz")
source_x86_64=("http://downloads.sourceforge.net/project/lsp-plugins/lsp-plugins/${pkgver}/${pkgname%-*}-$pkgver-x86_64.tar.gz")
sha1sums_i686=('1f61f5e414b320928132c1b0a1cfc7cb76aa5fc3')
sha1sums_x86_64=('1c015c597561947ca591063c73c29a16f5ad98bd')

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
