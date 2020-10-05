# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=xml2rfc
pkgver=3.2.1
pkgrel=1
pkgdesc='Generates RFCs and IETF drafts from document source in XML according to the DTD in RFC 2629'
url='https://pypi.python.org/pypi/xml2rfc'
arch=(any)
depends=(python python-lxml python-requests
	 python-pyflakes python-pycountry python-kitchen python-intervaltree
	 python-google-i18n-address python-html5lib python-six)
license=(custom:BSD)
source=("https://files.pythonhosted.org/packages/77/f4/98f717ab9acc7a4b476d0b46e6ff32cfd8966ad617c79cd3ff3cd3a388ce/xml2rfc-3.2.1.tar.gz")
sha512sums=('5a1a4df3df98fce90c58ab7c1ec19b610b78b1735bd79be2c28b7c29efc3c1679bc8d7c6a710dbf73e81711db3e3168946942d9663b097a15bc106191fd9bca3')
validpgpkeys=('89F8DCE7EAE72F530905C6524E9B574B8FBB171A') # Henrik Levkowetz <FIRSTNAME@SURNAME.com>

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/xml2rfc/LICENSE"
}
