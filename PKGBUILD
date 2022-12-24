# Maintainer: NOGISAKA Sadata <ngsksdt@gmail.com>
# vim:set ts=2 sw=2 et:

pkgname=python-mecab
_pkgname=mecab-python3
pkgver=1.0.6
_pkgver="v1.0.6"
pkgrel=1
pkgdesc="Morphological Analysis Tool - Python3 interface"
arch=('x86_64' 'i686')
url="http://taku910.github.io/mecab/"
license=('BSD' 'LGPL2.1' 'GPL2')
depends=('python' 'mecab' 'mecab-ipadic')
makedepends=('python-setuptools' 'python-wheel' 'python-pip' 'git' 'swig')
source=("git+https://github.com/SamuraiT/mecab-python3.git")
sha1sums=('SKIP')

prepare() {
  cd "${srcdir}/${_pkgname}"
  git checkout "${_pkgver}"
}

build() {
  cd "${srcdir}/${_pkgname}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}"
  python setup.py install --root=${pkgdir}
  install -Dm644 COPYING ${pkgdir}/usr/share/licenses/${pkgname}/COPYING
}
