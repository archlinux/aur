# Maintainer: Clint Valentine <valentine.clint@gmail.com>

_name=nucleus
pkgbase='python-nucleus'
pkgname=('python-nucleus' 'python2-nucleus')
pkgver=0.1.0
pkgrel=1
pkgdesc=" Python and C++ code for reading and writing genomics data."
arch=('any')
url="https://github.com/google/nucleus"
license=('Apache')
makedepends=(
  'python' 'python-setuptools'
  'python2' 'python2-setuptools')
options=(!emptydirs)
source=("${_name}"-"${pkgver}"::git+https://github.com/google/nucleus.git#commit=073c3c7af4ed0e3f401f8780417e9858f53b401f)
sha256sums=('SKIP')

prepare() {
  cp -a "${_name}"-"${pkgver}"{,-py2}
}

build(){
  cd "${srcdir}"/"${_name}"-"${pkgver}"

  cd "${srcdir}"/"${_name}"-"${pkgver}"-py2
}

package_python2-nucleus() {
  depends=(
    'bazel'
    'python2'
    'python2-contextlib2'
    'python2-intervaltree'
    'python2-mock'
    'python2-numpy'
    'python2-scipy'
    'tensorflow')

  cd "${_name}"-"${pkgver}"-py2
}

package_python-nucleus() {
  depends=(
    'bazel'
    'python'
    'python-contextlib2'
    'python-intervaltree'
    'python-mock'
    'python-numpy'
    'python-scipy'
    'tensorflow')

  cd "${_name}"-"${pkgver}"
}
