# Maintainer: NOGISAKA Sadata <ngsksdt@gmail.com>
# vim:set ts=2 sw=2 et:

pkgname=python2-cabocha
_pkgname=cabocha
pkgver=0.69
pkgrel=3
pkgdesc="Yet Another Japanese Dependency Structure Analyzer (Python2 interface)"
url="https://taku910.github.io/cabocha/"
arch=('any')
license=('LGPL2.1' 'BSD')
depends=('crfpp' 'mecab' 'cabocha' 'python2')
makedepends=('python2-setuptools' 'git')
source=('git+https://github.com/taku910/cabocha.git'
        'setup.patch')

prepare() {
  cd ${srcdir}/${_pkgname}/python
  patch < ${srcdir}/setup.patch
}

build() {
  cd ${srcdir}/${_pkgname}/python
  python2 setup.py build_ext
}

package() {
  cd ${srcdir}/${_pkgname}/python
  python2 setup.py install --root=${pkgdir}
  install -Dm644 ../COPYING ${pkgdir}/usr/share/licenses/${pkgname}/COPYING
}

sha256sums=('SKIP'
            '378c25c96b59f07f2e73739614e04fdba8d1723a294d9dd4c492d8190ed2a520')
