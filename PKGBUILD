# Maintainer: Cedric Girard <cgirard [dot] archlinux [at] valinor [dot] fr>
# Contributor: vorpalblade77@gmail.com
# Contributor: Daniel Neve <the.mephit@googlemail.com>
# Contributor: Eduardo Parra Mazuecos <eduparra90@gmail.com>
_name=pynzb
pkgname=python-$_name
pkgver=0.1.0
pkgrel=1
pkgdesc="A unified API for parsing NZB files"
arch=('any')
url="https://pypi.python.org/pypi/pynzb/"
license=('BSD')
depends=('python' 'expat')
makedepends=('python-distribute')
conflicts=('pynzb')
optdepends=('python-lxml: Use lxml instead of expat')
source=(https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz)
md5sums=('63c74a36348ac28aa99732dcb8be8c59')

build() {
  cd "$srcdir/${_name}-$pkgver"
  python setup.py build
}
package() {
  cd "$srcdir/${_name}-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
