# Maintainer: Joermungand <joermungand at gmail dot com>
pkgname=lsp-plugins-ladspa-bin
pkgver=1.0.22
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
sha1sums_i686=('9c0f6a65422153e423f883f4a28ae0718fab629c')
sha1sums_x86_64=('10d369464d17f219bda3cf0b5bce2075991619cf')

package() {
	cd $srcdir
	for i in */; do
		install -Dm755 $i/"${pkgname%-*}.so" "$pkgdir/usr/lib/ladspa/${pkgname%-*}.so"
		install -Dm644 $i/CHANGELOG.txt "$pkgdir/usr/share/doc/${pkgname%-*}/CHANGELOG"
		install -Dm644 $i/README.txt "$pkgdir/usr/share/doc/${pkgname%-*}/README"
		install -Dm644 $i/LICENSE.txt "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
	done
}
