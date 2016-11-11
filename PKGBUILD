# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>

pkgname=python-pyprind
pkgver=2.9.8
pkgrel=1
pkgdesc='Python Progress Bar and Percent Indicator Utility'
arch=('any')
url='https://github.com/rasbt/pyprind'
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
optdepends=('python-psutil: improved system information')
source=("pyprind-${pkgver}.tar.gz::https://github.com/rasbt/pyprind/archive/${pkgver}.tar.gz")
sha256sums=('03a52f3cc86b9090b451df36003e7e223a9bdbdbea54817a6d0814fbe8e93463')

build() {
  cd pyprind-${pkgver}
  python setup.py build
}

package(){
  cd pyprind-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize='1'
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
