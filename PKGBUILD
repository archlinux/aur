# Maintainer: Joermungand <joermungand at gmail dot com>
pkgname=lsp-plugins-ladspa-bin
pkgver=1.1.3
pkgrel=1
pkgdesc="Linux Studio Plugins: LADSPA format"
arch=('i686' 'x86_64')
url="http://lsp-plug.in"
license=('custom')
depends=('libsndfile')
optdepends=('lsp-plugins-doc: HTML documentation')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source_i686=("http://downloads.sourceforge.net/project/lsp-plugins/lsp-plugins/${pkgver}/${pkgname%-*}-$pkgver-i586.tar.gz")
source_x86_64=("http://downloads.sourceforge.net/project/lsp-plugins/lsp-plugins/${pkgver}/${pkgname%-*}-$pkgver-x86_64.tar.gz")
sha1sums_i686=('2a8bebbfbcc263f02b3272997e6bb03d0b21d1e2')
sha1sums_x86_64=('f78e2ed6d6d00060967a0fe8b1ab6427efbd0cea')

package() {
	cd $srcdir
	for i in */; do
		install -Dm755 $i/"${pkgname%-*}.so" "$pkgdir/usr/lib/ladspa/${pkgname%-*}.so"
		install -Dm644 $i/CHANGELOG.txt "$pkgdir/usr/share/doc/${pkgname%-*}/CHANGELOG"
		install -Dm644 $i/README.txt "$pkgdir/usr/share/doc/${pkgname%-*}/README"
		install -Dm644 $i/LICENSE.txt "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
	done
}
