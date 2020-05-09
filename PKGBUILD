# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=xml2rfc
pkgver=2.44.0
pkgrel=2
pkgdesc='Generates RFCs and IETF drafts from document source in XML according to the DTD in RFC 2629'
url='https://pypi.python.org/pypi/xml2rfc'
arch=(any)
depends=(python python-lxml python-requests
	 python-pyflakes python-pycountry python-kitchen python-intervaltree
	 python-google-i18n-address python-html5lib)
license=(custom:BSD)
source=("https://files.pythonhosted.org/packages/96/41/b30e3952dfd4915472a1c218651e319cd1502736fca6f10bf4b1d1498372/xml2rfc-2.44.0.tar.gz")
sha512sums=('fc6cf12963ad115e52e4aa830cc4ce7a6b2a9d716411f9bcde0e2aaa97efcb2f0745af1b54b4a3a70727ed68c3af6b47b9b3d3d90e8eaa54094f0016046a1c5d')
validpgpkeys=('89F8DCE7EAE72F530905C6524E9B574B8FBB171A') # Henrik Levkowetz <FIRSTNAME@SURNAME.com>

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/xml2rfc/LICENSE"
}
