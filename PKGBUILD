# Maintainer: Sam Whited <sam@samwhited.com>

pkgname=ietf-xml2rfc
_name=${pkgname#ietf-}
pkgver=2.44.0
pkgrel=1
pkgdesc='Generates RFCs and IETF Internet Drafts from XML according to RFC 7749.'
url='https://pypi.python.org/pypi/xml2rfc'
arch=(any)
provides=("$_name")
conflicts=("$_name")
depends=(python-google-i18n-address
         python-html5lib
         python-intervaltree
         python-kitchen
         python-lxml
         python-pycountry
         python-pyflakes
         python-requests
         python-six)
license=(BSD)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('e6631aa2699942f387705e9fb624655b99f43abd87091bc94a3f6b82f2aabb4e')

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
