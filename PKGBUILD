# Maintainer: Joermungand <joermungand at gmail dot com>
pkgname=lsp-plugins-lv2-bin
pkgver=1.0.24
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
sha1sums_i686=('7e6808044ac3c432bac938634622d7fd0873a416')
sha1sums_x86_64=('defe738f2702c3feba03111fc841b722c6a5fc9b')

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
