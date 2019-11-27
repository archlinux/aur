pkgname=python-cu2qu
_module=cu2qu
pkgver=1.6.6
pkgrel=1
pkgdesc="Cubic-to-quadratic bezier curve conversion"
url="https://github.com/googlefonts/cu2qu"
depends=('python-defcon' 'python-fonttools')
makedepends=('python-setuptools' 'cython')
checkdepends=('python-coverage' 'python-pytest')
license=('Apache')
arch=('any')
source=("https://pypi.org/packages/source/c/cu2qu/cu2qu-${pkgver}.zip")
md5sums=('743a853645c26d1a3f4d18529c1bcdd2')

build() {
  cd "${srcdir}/${_module}-${pkgver}"
  python setup.py build
}

check() {
  cd "${srcdir}/${_module}-${pkgver}"
  python setup.py test
}

package() {
  depends+=()
  cd "${srcdir}/${_module}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  chmod -R o+r ${pkgdir}
}

