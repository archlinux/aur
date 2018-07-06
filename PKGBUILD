# Maintainer: Joermungand <joermungand at gmail dot com>
pkgname=lsp-plugins-lxvst-bin
pkgver=1.1.3
pkgrel=1
pkgdesc="Linux Studio Plugins: VST format"
arch=('i686' 'x86_64')
url="http://lsp-plug.in"
license=('custom')
depends=('libsndfile' 'cairo')
optdepends=('lsp-plugins-doc: HTML documentation')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source_i686=("http://downloads.sourceforge.net/project/lsp-plugins/lsp-plugins/${pkgver}/${pkgname%-*}-$pkgver-i586.tar.gz")
source_x86_64=("http://downloads.sourceforge.net/project/lsp-plugins/lsp-plugins/${pkgver}/${pkgname%-*}-$pkgver-x86_64.tar.gz")
sha1sums_i686=('570ba55cb3aec44d5eb9f4be8e4c514e22db5c5d')
sha1sums_x86_64=('a27b12dff64292b83e1ea3ed26daf1f004a63d55')

package() {
	cd $srcdir
	for i in */; do
		install -dm755 "$pkgdir/usr/lib/vst"
		install -Dm755 $i/*.so "$pkgdir/usr/lib/vst/"
		install -Dm644 $i/CHANGELOG.txt "$pkgdir/usr/share/doc/${pkgname%-*}/CHANGELOG"
		install -Dm644 $i/README.txt "$pkgdir/usr/share/doc/${pkgname%-*}/README"
		install -Dm644 $i/LICENSE.txt "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
	done
}
