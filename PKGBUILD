# Maintainer: Sam Whited <sam@samwhited.com>

pkgname="python-virtualenv-tools3"
_name=${pkgname#python-}
pkgver=3.1.1
pkgrel=1
pkgdesc="Allows moving a virtualenv to a new location without breaking links."
arch=('any')
url="https://github.com/Yelp/virtualenv-tools"
license=('BSD-like')
depends=('python')
makedepends=('python-setuptools')
options=('!emptydirs')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('3c473d16d70ef71457f4a00f75ac145a73b21f7d69ae2805fb0392f365c92de8')

package() {
  cd "$srcdir/virtualenv_tools3-$pkgver"
  python3 setup.py install --root="$pkgdir" -O1
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  install -D LICENSE "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set ts=2 sw=2 et:

