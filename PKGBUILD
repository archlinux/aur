# Maintainer: William Turner <willtur.will@gmail.com>
pkgbase=python-booleanoperations
pkgname=(python-booleanoperations python2-booleanoperations)
_pkgname=booleanOperations
pkgver=0.8.0
pkgrel=1
pkgdesc='Boolean operations on paths based on a super fast polygon clipper library by Angus Johnson.'
arch=('any')
url='https://github.com/typemytype/booleanOperations'
license=('MIT')
depends=('python' 'python-pyclipper' 'python-fonttools' 'python-ufolib'
         'python2' 'python2-pyclipper' 'python2-fonttools' 'python2-ufolib')
makedepends=('python-pip' 'python2-pip')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/py2.py3/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}-py2.py3-none-any.whl")
sha256sums=('e405de0126aaf0f6e4f3dcebd18079db601e825e123cb095366b2a50e9abbc8c')

package_python-booleanoperations() {
  depends=('python' 'python-pyclipper' 'python-fonttools' 'python-ufolib')
  provides=('python-booleanoperations')

  cd "${srcdir}"

  # install the wheel
  PIP_CONFIG_FILE=/dev/null pip install \
    --isolated \
    --root="${pkgdir}" \
    --ignore-installed \
    --no-deps \
    ${_pkgname}-${pkgver}-py2.py3-none-any.whl

  # compile to pyo
  python -O -m compileall "${pkgdir}"
}

package_python2-booleanoperations() {
  depends=('python2' 'python2-pyclipper' 'python2-fonttools' 'python2-ufolib')
  provides=('python2-booleanoperations')

  cd "${srcdir}"

  # install the wheel
  PIP_CONFIG_FILE=/dev/null pip2 install \
    --isolated \
    --root="${pkgdir}" \
    --ignore-installed \
    --no-deps \
    ${_pkgname}-${pkgver}-py2.py3-none-any.whl

  # compile to pyo
  python2 -O -m compileall "${pkgdir}"
}
