# Maintainer: Luis Aranguren <pizzaman@hotmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: Niklas <dev@n1klas.net>

pkgbase=python-pylru
pkgname=('python-pylru')
_name=pylru
pkgver=1.2.0
pkgrel=3
pkgdesc="A least recently used (LRU) cache implementation"
arch=('any')
url="https://github.com/jlhutch/pylru"
license=('GPL2')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("${_name}-${pkgver}.tar.gz::https://github.com/jlhutch/pylru/archive/v${pkgver}.tar.gz")
sha256sums=('c4dcf175f6317539199434db13ffea0f642a52fac1e547e2e5f0866686fc9292')

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
