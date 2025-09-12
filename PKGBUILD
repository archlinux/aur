# Maintainer: envolution
# Contributor: Jean-Gabriel Young <info@jgyoung.ca>
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=python-mistral-common
_pkgname=mistral-common
pkgver=1.8.5
pkgrel=1
pkgdesc="set of tools to help you work with Mistral models"
arch=('x86_64')
url='https://pypi.org/project/mistral-common'
license=('Apache-2.0')
depends=(python)
makedepends=(
  python-build
  python-installer
  python-wheel
  python-poetry
  python-setuptools
)
source=("https://files.pythonhosted.org/packages/source/m/mistral-common/mistral_common-${pkgver}.tar.gz")

sha256sums=('9f6204ede9c807f09040a208a9381ae78ef93e2e5a9cd5202dc12e712a025de8')

build() {
  cd "mistral_common-${pkgver}"
  python -m build --wheel --no-isolation
}

#check() {
#  cd $_pkgname-$pkgver
# python -m pytest -s -v tests
# tests work, but a lot of them need disabling due to external services
#}

package() {
  cd "mistral_common-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
#  install -Dm644 LICENCE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE # missing in 1.6.0
}
# vim:set ts=2 sw=2 et:
