# Maintainer: NOGISAKA Sadata <ngsksdt@gmail.com>
# vim:set ts=2 sw=2 et:

pkgname=python-cabocha
_pkgname=cabocha
pkgver=0.69
pkgrel=3
pkgdesc="Yet Another Japanese Dependency Structure Analyzer (Python interface)"
url="https://taku910.github.io/cabocha/"
arch=('any')
license=('LGPL2.1' 'BSD')
depends=('crfpp' 'mecab' 'cabocha' 'python')
makedepends=('python-setuptools' 'git')
source=('git+https://github.com/taku910/cabocha.git')

build() {
  cd ${srcdir}/${_pkgname}/python
  python setup.py build_ext
}

package() {
  cd ${srcdir}/${_pkgname}/python
  python setup.py install --root=${pkgdir}
  install -Dm644 ../COPYING ${pkgdir}/usr/share/licenses/${pkgname}/COPYING
}

sha256sums=('SKIP')
