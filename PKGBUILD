pkgname=xml2rfc
pkgver=2.5.1
pkgrel=1
pkgdesc='Generates RFCs and IETF drafts from document source in XML according to the DTD in RFC 2629'
arch=(any)
depends=(python python-lxml python-requests)
license=(custom:BSD)
source=("https://pypi.python.org/packages/source/${pkgname:0:1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha512sums=('47980094f58a8f77ead5fd11c7d8d1b317c18fb646823a60fd9aa23b68b745f81d844bee15b4ab7614d19081629201cad97c6bae53c7962df0a6e9d1c0c51e96')

package() {
	cd "$srcdir/$pkgname-$pkgver"
	python setup.py install --root="$pkgdir"

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/xml2rfc/LICENSE"
}
