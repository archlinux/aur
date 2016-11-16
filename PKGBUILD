# Maintainer: Joermungand <joermungand at gmail dot com>
pkgname=lsp-plugins-ladspa-bin
pkgver=1.0.16
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
sha1sums_i686=('4029dcf0545014af52f701b67a84ebbb16343546')
sha1sums_x86_64=('2730e3e10da60ef28856dc23925b40bdfe70341d')

package() {
	cd $srcdir
	for i in */; do
		install -Dm755 $i/"${pkgname%-*}.so" "$pkgdir/usr/lib/ladspa/${pkgname%-*}.so"
		install -Dm644 $i/CHANGELOG.txt "$pkgdir/usr/share/doc/${pkgname%-*}/CHANGELOG"
		install -Dm644 $i/README.txt "$pkgdir/usr/share/doc/${pkgname%-*}/README"
		install -Dm644 $i/LICENSE.txt "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
	done
}
