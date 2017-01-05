# Maintainer: William Turner <willtur.will@gmail.com>
pkgbase=python-mutatormath
pkgname=(python-mutatormath python2-mutatormath)
_pkgname=MutatorMath
pkgver=2.0.0
pkgrel=1
pkgdesc='A library for the calculation of piecewise linear interpolations in n-dimensions with any number of masters.'
arch=('any')
url='https://github.com/LettError/MutatorMath'
license=('BSD')
makedepends=('python-pip' 'python2-pip')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/py2.py3/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}-py2.py3-none-any.whl")
sha256sums=('a29587df7c6670ba232caf4cb1b2c9bd1dd338fe6ac969d531f1bd7d6f29cce7')

package_python-mutatormath() {
  depends=('python')
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
  depends=('python2')
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
