# Maintainer: Joermungand <joermungand at gmail dot com>
pkgname=lsp-plugins-lv2-bin
pkgver=1.1.1
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
sha1sums_i686=('b67aa9a314164180a9f16c01c83748522bcd4061')
sha1sums_x86_64=('3b78177153b6e2be98d7543009d9a16ef0e628e0')

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
