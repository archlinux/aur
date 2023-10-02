# Maintainer: thrasibule <guillaume.horel@gmail.com>
# Contributor: Lorenzo Cappelletti <lorenzo.cappelletti gmail.com>

pkgname=python-pydash
pkgver=7.0.6
pkgrel=1
pkgdesc='The kitchen sink of Python utility libraries for doing "stuff" in a functional way. Based on the Lo-Dash Javascript library.'
arch=('any')
url='https://github.com/dgilland/pydash'
license=('MIT')
checkdepends=(python-pytest)
makedepends=(python-build python-installer python-wheel)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('f60e43ff71f0031650e603b5e754ebe78b9cdb333f3a0397ce78627dbf099371')

build() {
  cd "pydash-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "pydash-${pkgver}"
  python -m installer --destdir="{pkgdir}" dist/*.whl
}

#check() {
  #cd "pydash-${pkgver}"
  #PYTHONPATH=src pytest tests
#}

