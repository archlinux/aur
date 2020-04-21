# Maintainer: Sam Whited <sam@samwhited.com>

_pkgname=id2xml
pkgname=ietf-id2xml
pkgver=1.5.0
pkgrel=1
pkgdesc='Convert internet-draft text to XML'
url='https://pypi.org/project/id2xml/'
arch=(any)
depends=(python
         python-decorator
         python-lxml
         python-pathlib2
         python-requests
         python-six
         xml2rfc)
license=(custom:BSD)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('589c74051e0da91096b46af5d6ab33a616085a0551405b4e2fc254e3180c1107')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/id2xml/LICENSE"
}
