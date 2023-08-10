# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=xml2rfc
pkgver=3.18.0
pkgrel=1
pkgdesc='Generates RFCs and IETF drafts from document source in XML according to the DTD in RFC 2629'
url='https://pypi.python.org/pypi/xml2rfc'
arch=(any)
depends=(python python-lxml python-requests python-platformdirs python-setuptools
	 python-pyflakes python-pycountry python-kitchen python-intervaltree
	 python-google-i18n-address python-html5lib python-six)
license=(custom:BSD)
source=("https://files.pythonhosted.org/packages/af/83/de038ef67a675ad464bedd77e495375fcd5e5c69b93f4807382a99a3a6c9/xml2rfc-3.18.0.tar.gz")
sha512sums=('790932ead5e37f7cf95ebbd37246bfd4e356db6fb8bd4d5215fa4070515025706d7a23c9193100aea4358e99ea622350c184b48a64f7c87a995fc01e885ed793')
validpgpkeys=('89F8DCE7EAE72F530905C6524E9B574B8FBB171A') # Henrik Levkowetz <FIRSTNAME@SURNAME.com>

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/xml2rfc/LICENSE"
}
