# Maintainer: Joermungand <joermungand at gmail dot com>
pkgname=lsp-plugins-jack-bin
pkgver=1.1.3
pkgrel=1
pkgdesc="Linux Studio Plugins: standalone Jack version"
arch=('i686' 'x86_64')
url="http://lsp-plug.in"
license=('custom')
depends=('cairo' 'jack')
optdepends=('lsp-plugins-doc: HTML documentation')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source_i686=("http://downloads.sourceforge.net/project/lsp-plugins/lsp-plugins/${pkgver}/${pkgname%-*}-$pkgver-i586.tar.gz")
source_x86_64=("http://downloads.sourceforge.net/project/lsp-plugins/lsp-plugins/${pkgver}/${pkgname%-*}-$pkgver-x86_64.tar.gz")
sha1sums_i686=('ec8b5f9a0a9d69bdd313af2a272d39c7209efbcb')
sha1sums_x86_64=('b532b54ab3992b0e27f09a7be8b8f442d1f9681c')

package() {
	cd $srcdir
	for i in */; do
		install -dm755 "$pkgdir/usr/bin/"
		install -Dm755 $i/bin/* "$pkgdir/usr/bin/"
		install -dm755 "$pkgdir/usr/lib/"
		install -Dm755 "${i}/lib/${pkgname%-*}-core-$pkgver-x86_64.so" "$pkgdir/usr/lib/"
		install -Dm644 $i/CHANGELOG.txt "$pkgdir/usr/share/doc/${pkgname%-*}/CHANGELOG"
		install -Dm644 $i/README.txt "$pkgdir/usr/share/doc/${pkgname%-*}/README"
		install -Dm644 $i/LICENSE.txt "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
	done
}
