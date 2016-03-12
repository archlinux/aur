# Maintainer: Joermungand <joermungand at gmail dot com>
pkgname=lsp-plugins-lxvst-bin
pkgver=1.0.4
pkgrel=1
pkgdesc="Linux Studio Plugins: VST format"
arch=('i686' 'x86_64')
url="http://lsp-plug.in"
license=('custom')
depends=('libsndfile' 'gtk2')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source_i686=("http://downloads.sourceforge.net/project/lsp-plugins/v1.0.4/${pkgname%-*}-$pkgver-i586.tar.gz")
source_x86_64=("http://downloads.sourceforge.net/project/lsp-plugins/v1.0.4/${pkgname%-*}-$pkgver-x86_64.tar.gz")
sha1sums_i686=('8b6b4fb04dd9a447a3621656fc0b458a19943f06')
sha1sums_x86_64=('64603793d5ed0ee750b4970835ec95eed576f259')

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
