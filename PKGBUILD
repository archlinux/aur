# Contributor : vorpalblade77@gmail.com
# Contributor : Daniel Neve <the.mephit@googlemail.com>
# Maintainer: Eduardo Parra Mazuecos <eduparra90@gmail.com>
_name=pynzb
pkgname=python2-$_name
pkgver=0.1.0
pkgrel=4
pkgdesc="A unified API for parsing NZB files"
arch=('any')
url="http://pypi.python.org/pypi/pynzb/"
license=('BSD')
depends=('python2' 'expat')
makedepends=('python2-distribute')
conflicts=('pynzb')
optdepends=('python-lxml: Use lxml instead of expat')
source=(https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz)
md5sums=('63c74a36348ac28aa99732dcb8be8c59')

build() {
  cd "$srcdir/${_name}-$pkgver"
  python2 setup.py build
}
package() {
  cd "$srcdir/${_name}-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
