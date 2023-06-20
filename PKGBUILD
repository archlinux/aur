# Maintainer: thrasibule <guillaume.horel@gmail.com>
# Contributor: Lorenzo Cappelletti <lorenzo.cappelletti gmail.com>

pkgname=python-pydash
pkgver=5.1.0
pkgrel=1
pkgdesc='The kitchen sink of Python utility libraries for doing "stuff" in a functional way. Based on the Lo-Dash Javascript library.'
arch=('any')
url='https://github.com/dgilland/pydash'
license=('MIT')
checkdepends=(python-pytest)
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('283cd607eea38b0b209b23a7d6239dec993933e699672c854d937848f1d1d134')

build() {
  cd "pydash-${pkgver}"
  python setup.py build
}

package() {
  cd "pydash-${pkgver}"
  python setup.py install --skip-build --root="${pkgdir}/" --optimize=1
}

check() {
  cd "pydash-${pkgver}"
  PYTHONPATH=src pytest tests
}

