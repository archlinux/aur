# Maintainer: Sam Whited <sam@samwhited.com>

pkgname=ietf-id2xml
_name=${pkgname#ietf-}
pkgver=1.5.0
pkgrel=3
pkgdesc='Convert internet-draft text to XML'
url='https://pypi.org/project/id2xml/'
arch=(any)
provides=("$_name")
conflicts=("$_name")
depends=(python-decorator
         python-lxml
         python-pathlib2
         python-six
         xml2rfc)
license=(BSD)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('589c74051e0da91096b46af5d6ab33a616085a0551405b4e2fc254e3180c1107')

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
