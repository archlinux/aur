pkgname=python-openexr
_name=OpenEXR
pkgver=1.3.2
pkgrel=1
pkgdesc="Python bindings for ILM's OpenEXR image file format"
url='https://github.com/jamesbowman/openexrpython'
arch=('any')
license=('unknown')
depends=('openexr')
source=(https://files.pythonhosted.org/packages/7c/c4/76bf884f59d3137847edf8b93aaf40f6257d8315d0064e8b1a606ad80b1b/${_name}-${pkgver}.tar.gz)
sha512sums=('b4b85f3f8860639c4f65a3fe59c721e08573ffe9b2af5cc7e398d9ff249bac604b43fa5bda6f05f8cd248ed7346df1a2972ac7c5a3df12fe0a73b859c618e33d')

build() {
  cd ${_name}-${pkgver}
  python setup.py build
}

package() {
  cd ${_name}-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
