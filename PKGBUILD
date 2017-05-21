# Maintainer: Joermungand <joermungand at gmail dot com>
pkgname=lsp-plugins-ladspa-bin
pkgver=1.0.24
pkgrel=1
pkgdesc="Linux Studio Plugins: LADSPA format"
arch=('i686' 'x86_64')
url="http://lsp-plug.in"
license=('custom')
depends=('libsndfile')
optdepends=('lsp-plugins-doc: HTML documentation')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source_i686=("http://downloads.sourceforge.net/project/lsp-plugins/v${pkgver}/${pkgname%-*}-$pkgver-i586.tar.gz")
source_x86_64=("http://downloads.sourceforge.net/project/lsp-plugins/v${pkgver}/${pkgname%-*}-$pkgver-x86_64.tar.gz")
sha1sums_i686=('e9c75b53a08b3f20ef9626d1d0e9ede9f79ae3e2')
sha1sums_x86_64=('d497b6bb66fcdd0a67d25914c5a6156253787d83')

package() {
	cd $srcdir
	for i in */; do
		install -Dm755 $i/"${pkgname%-*}.so" "$pkgdir/usr/lib/ladspa/${pkgname%-*}.so"
		install -Dm644 $i/CHANGELOG.txt "$pkgdir/usr/share/doc/${pkgname%-*}/CHANGELOG"
		install -Dm644 $i/README.txt "$pkgdir/usr/share/doc/${pkgname%-*}/README"
		install -Dm644 $i/LICENSE.txt "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
	done
}
