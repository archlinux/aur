# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=xml2rfc
pkgver=3.12.3
pkgrel=1
pkgdesc='Generates RFCs and IETF drafts from document source in XML according to the DTD in RFC 2629'
url='https://pypi.python.org/pypi/xml2rfc'
arch=(any)
depends=(python python-lxml python-requests
	 python-pyflakes python-pycountry python-kitchen python-intervaltree
	 python-google-i18n-address python-html5lib python-six)
license=(custom:BSD)
source=("https://files.pythonhosted.org/packages/4e/63/e05e6d3edead8494ef32edbf6872ad1de4e26c0aac5617f09da64f022186/xml2rfc-3.12.3.tar.gz")
sha512sums=('56ec3cbc87fe79719b56896da4715a1340c788cc21761352377010d098785d5d64209552fc34c3878bcd9521c811c8ab60ad2c8ad3d03f2a28965ecaf8e27650')
validpgpkeys=('89F8DCE7EAE72F530905C6524E9B574B8FBB171A') # Henrik Levkowetz <FIRSTNAME@SURNAME.com>

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/xml2rfc/LICENSE"
}
