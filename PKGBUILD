# Maintainer: Joermungand <joermungand at gmail dot com>
pkgname=lsp-plugins-jack-bin
pkgver=1.0.23
pkgrel=1
pkgdesc="Linux Studio Plugins: standalone Jack version"
arch=('i686' 'x86_64')
url="http://lsp-plug.in"
license=('custom')
depends=('libsndfile' 'gtk2' 'jack')
optdepends=('lsp-plugins-doc: HTML documentation')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source_i686=("http://downloads.sourceforge.net/project/lsp-plugins/v${pkgver}/${pkgname%-*}-$pkgver-i586.tar.gz")
source_x86_64=("http://downloads.sourceforge.net/project/lsp-plugins/v${pkgver}/${pkgname%-*}-$pkgver-x86_64.tar.gz")
sha1sums_i686=('e17be57a645fbccf53a446bb7216b84c05af11c0')
sha1sums_x86_64=('16a18da9321223bb588bbf2e91597c11a214c87c')

package() {
	cd $srcdir
	for i in */; do
		install -dm755 "$pkgdir/usr/bin/"
		install -Dm755 $i/bin/* "$pkgdir/usr/bin/"
		install -dm755 "$pkgdir/usr/lib/"
		install -Dm755 "$i/lib/${pkgname%-*}-core.so" "$pkgdir/usr/lib/"
		install -Dm644 $i/CHANGELOG.txt "$pkgdir/usr/share/doc/${pkgname%-*}/CHANGELOG"
		install -Dm644 $i/README.txt "$pkgdir/usr/share/doc/${pkgname%-*}/README"
		install -Dm644 $i/LICENSE.txt "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
	done
}
