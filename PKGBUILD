# Maintainer: Yuuki Rika <yvvki@duck.com>

_pkgname=py-emmet
pkgname=python-${_pkgname}
pkgver=1.3.1
pkgrel=1
pkgdesc='Emmet is a web-developer’s toolkit for boosting HTML & CSS code writing.'
arch=(any)
url="https://pypi.org/project/${_pkgname}/"
license=(MIT)
depends=('python>=3.3')
makedepends=(python-setuptools)
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/emmetio/py-emmet/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('73a3ca3444c6108f3d1fb28e15ef4010966f485ec961af49e8901a3f14d6d35534b6c934cc064becfdcf663a63d1f95bb3034db40dcfb4a07a7bc502fe469c33')

build() {
  cd "${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --skip-build --root="${pkgdir}" --optimize=1
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

