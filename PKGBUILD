# Maintainer: haxibami <contact at haxibami dot net>

pkgname=python-parameter-decorators
_pkgname="${pkgname#python-}"
pkgver=0.0.2
pkgrel=2
pkgdesc='Handy decorators for converting parameters'
arch=('any')
url='https://github.com/matan1008/parameter-decorators'
license=('GPL-3.0-or-later')
depends=('python')
makedepends=('python-build' 'python-wheel' 'python-installer' 'python-setuptools')
checkdepends=('python-pytest')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('aecfbad32075b6eb58fb1b1e78c3548c592a7261430209e7380d4d93210707d0')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m pytest
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
