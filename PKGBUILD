# Maintainer: Rafael Silva <perigoso@riseup.net>

_modulename='sphinxcontrib-platformpicker'
pkgname="python-${_modulename}"
pkgver=1.3
pkgrel=1
pkgdesc='Platform picker extension for Sphinx.'
arch=('any')
url="https://github.com/whitequark/${_modulename}"
license=('MIT')
depends=(
  'python-sphinx'
)
makedepends=(
  'python-setuptools'
)
source=("${_modulename}-${pkgver}.tar.gz::https://github.com/whitequark/${_modulename}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('f0c3207f0f758fb5c0fd1661098b0bf212ad2d4bb24a3bbbe8178590e3634460e2d6b96839e87c5e0b3771f47a7e64d8f7ce34024acd4b66c94a9f6faddc4413')

build() {
  cd "${_modulename}-${pkgver}"

  python setup.py build
}

package() {
  cd "${_modulename}-${pkgver}"

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
