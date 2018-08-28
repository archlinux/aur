# Maintainer: William Turner <willtur.will@gmail.com>
pkgbase=python-mutatormath
pkgname=(python-mutatormath python2-mutatormath)
_pkgname=MutatorMath
pkgver=2.1.1
pkgrel=1
pkgdesc='A library for the calculation of piecewise linear interpolations in n-dimensions with any number of masters.'
arch=('any')
url='https://github.com/LettError/MutatorMath'
license=('BSD')
depends=('python' 'python-fonttools' 'python-ufolib' 'python-defcon' 'python-fontmath'
         'python2' 'python2-fonttools' 'python2-ufolib' 'python2-defcon' 'python2-fontmath')
makedepends=('python-pip' 'python2-pip')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/py2.py3/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}-py2.py3-none-any.whl")
sha256sums=('e6da8ae2a7008085ee0bac6d62737d37b90ce4a883d89a0f3d5c19dd350b0538')

package_python-mutatormath() {
  depends=('python' 'python-fonttools' 'python-ufolib' 'python-defcon' 'python-fontmath')
  provides=('python-mutatormath')

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

package_python2-mutatormath() {
  depends=('python2' 'python2-fonttools' 'python2-ufolib' 'python2-defcon' 'python2-fontmath')
  provides=('python2-mutatormath')

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
