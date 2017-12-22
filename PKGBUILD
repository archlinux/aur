# Maintainer: Joermungand <joermungand at gmail dot com>
pkgname=lsp-plugins-doc
pkgver=1.1.0
pkgrel=1
pkgdesc="HTML documentation for LSP Plugins"
arch=('any')
url="http://lsp-plug.in"
license=('custom')
source=("http://downloads.sourceforge.net/project/lsp-plugins/v${pkgver}/${pkgname}-$pkgver.tar.gz")
sha1sums=('2b257f841b5f38ee17949a085051480a439d962d')

package() {
	cd $srcdir
	install -dm644 "$pkgdir/usr/share/doc/$pkgname/"
	for file in $(find "$pkgname-$pkgver/" -type f); do
	     if [ ${file##*/} != LICENSE.txt ]; then
             install -m 644 -D ${file} $pkgdir/usr/share/doc/$pkgname/${file#"$pkgname-$pkgver/"}
		 fi
	done
	install -Dm644 $pkgname-$pkgver/LICENSE.txt "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
