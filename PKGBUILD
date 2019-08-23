pkgname=python-cu2qu
_module=cu2qu
pkgver=1.6.5
pkgrel=1
pkgdesc="Cubic-to-quadratic bezier curve conversion"
url="https://github.com/googlefonts/cu2qu"
depends=('python' 'python-defcon' 'python-fonttools')
makedepends=('python-setuptools' 'cython' 'python-pytest')
license=('Apache')
arch=('any')
source=("https://pypi.org/packages/source/c/cu2qu/cu2qu-${pkgver}.zip")
#source=("https://github.com/googlefonts/cu2qu/archive/v${pkgver}.tar.gz")
md5sums=('083bc4e78c46d36b1cb9bf3ddad6f8ae')

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

