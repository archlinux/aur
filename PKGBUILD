# Maintainer: Swift Geek
pkgname=python-textile
_pipname=textile
pkgver=2.1.4
pkgrel=1
pkgdesc="Python port of Textile, Dean Allen’s humane web text generator"
arch=('any')
url="https://github.com/textile/python-textile"
license=('BSD')
depends=('python')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/t/${_pipname}/${_pipname}-${pkgver}.tar.gz")
md5sums=('05ebee989379d5930e779f85d276abed')

package() {
  cd "$srcdir/$_pipname-$pkgver"
  2to3 -w .
  2to3 -w -d .
  sed -i 's/2\.1\.4/2\.1\.4-py3k/g' PKG-INFO
  sed -i 's/2\.1\.4/2\.1\.4-py3k/g' textile/functions.py
  sed -i 's/2\.1\.4/2\.1\.4-py3k/g' setup.py
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
