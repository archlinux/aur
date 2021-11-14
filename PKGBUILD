# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=xml2rfc
pkgver=3.11.1
pkgrel=1
pkgdesc='Generates RFCs and IETF drafts from document source in XML according to the DTD in RFC 2629'
url='https://pypi.python.org/pypi/xml2rfc'
arch=(any)
depends=(python python-lxml python-requests
	 python-pyflakes python-pycountry python-kitchen python-intervaltree
	 python-google-i18n-address python-html5lib python-six)
license=(custom:BSD)
source=("https://files.pythonhosted.org/packages/4f/cb/ddc53d4aada4f08b73027258c4d2048393a162193d8dee52622a0a03b409/xml2rfc-3.11.1.tar.gz")
sha512sums=('e39b15c160c86d9d70ac6e51bd97f1787814f1ced9503dd9f202c04cf14101db1e981fe9696afeb9854bd2992e498882b409576016cf05a06e5b15bc7115c9d8')
validpgpkeys=('89F8DCE7EAE72F530905C6524E9B574B8FBB171A') # Henrik Levkowetz <FIRSTNAME@SURNAME.com>

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/xml2rfc/LICENSE"
}
