# Maintainer: Luis Aranguren <pizzaman@hotmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: Niklas <dev@n1klas.net>

pkgbase=python-pylru
pkgname=('python-pylru')
_name=pylru
pkgver=1.2.1
pkgrel=1
pkgdesc="A least recently used (LRU) cache implementation"
arch=('any')
url="https://github.com/jlhutch/pylru"
license=('GPL2')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("${_name}-${pkgver}.tar.gz::https://github.com/jlhutch/pylru/archive/v${pkgver}.tar.gz")
sha256sums=('8d8d5ac67c5567137c53cf505a851a0c125666bd64402a111f141ae35db00859')

prepare() {
  cp -a ${_name}-${pkgver}{,-python2}
}

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build
}

package_python-pylru() {
  depends=('python')

  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}" --skip-build --optimize=1
}
