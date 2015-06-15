# Maintainer: Mikkel Oscar Lyderik <mikkeloscar at gmail dot com>

_py=python2
_gituser=salimfadhley
_gitname=jenkinsapi
_pyname=jenkinsapi

pkgname=${_py}-${_pyname}
pkgver=0.2.28
pkgrel=1
pkgdesc="A Python API for accessing resources on a Jenkins continuous-integration server."
arch=('any')
url="https://github.com/${_gituser}/${_gitname}"
license=('MIT')
depends=(${_py} "${_py}-requests" "${_py}-pytz")
makedepends=("${_py}-distribute")
source=("http://pypi.python.org/packages/source/j/${_pyname}/${_pyname}-${pkgver}.tar.gz")
sha1sums=('7bad3b0f63297cd6bb92c6a83447e2e71f91622e')

build() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  # build module
  ${_py} setup.py build
}

package() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  ${_py} setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:
