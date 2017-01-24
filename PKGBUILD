pkgname=xml2rfc
pkgver=2.5.2
pkgrel=1
pkgdesc='Generates RFCs and IETF drafts from document source in XML according to the DTD in RFC 2629'
url='https://pypi.python.org/pypi/xml2rfc'
arch=(any)
depends=(python python-lxml python-requests)
license=(custom:BSD)
source=(
	"https://files.pythonhosted.org/packages/source/${pkgname:0:1}/$pkgname/$pkgname-$pkgver.tar.gz"
	"https://files.pythonhosted.org/packages/source/${pkgname:0:1}/$pkgname/$pkgname-$pkgver.tar.gz.asc"
)
sha512sums=(
	'492affeeef41d7cb1a58e012ba3f33448097f93d6d9c94435938115d5fe96577087babb9386ba222fd40069b311e898056df699776b3c5513556818873504136'
	'SKIP'
)
validpgpkeys=('89F8DCE7EAE72F530905C6524E9B574B8FBB171A') # Henrik Levkowetz <FIRSTNAME@SURNAME.com>

package() {
	cd "$srcdir/$pkgname-$pkgver"
	python setup.py install --root="$pkgdir"

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/xml2rfc/LICENSE"
}
