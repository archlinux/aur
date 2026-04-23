# Maintainer: Mingxun Hua <huamingxun@gmail.com>
pkgname=python-pyosmocom
_name=pyosmocom
pkgver=0.0.12
pkgrel=1
pkgdesc='Python implementation of core Osmocom utilities and protocols'
arch=('any')
url='https://osmocom.org/projects/pyosmocom/wiki'
license=('GPL-2.0-or-later')
depends=(
  'python'
  'python-construct'
  'python-gsm0338'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('10c3a7ae6b84c9ef72ab5c71eec435f5f2f3c92ef39fabc669b661ed972b2fff')

build() {
  cd "${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
