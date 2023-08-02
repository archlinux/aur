# Contributor: Sam Whited <sam@samwhited.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=ietf-id2xml
_name=${pkgname#ietf-}
pkgver=1.5.2
pkgrel=1
pkgdesc='Convert internet-draft text to XML'
url='https://pypi.org/project/id2xml/'
arch=(any)
provides=("$_name")
conflicts=("$_name")
depends=(python-decorator
         python-lxml
         python-six
         xml2rfc)
license=(BSD)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('6016b8d9ef8c7fc83f03eac90d17a12ea09139587e39df4358434f6899ccd9d5')

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
