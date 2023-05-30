# Maintainer: Butui Hu <hot123tea123@gmail.com>
# Contributor: Tommy Li <ttoo74@gmail.com>

_pkgname=sacremoses
pkgname=python-sacremoses
pkgver=0.0.53
pkgrel=2
pkgdesc='Python port of Moses tokenizer, truecaser and normalizer'
arch=('any')
url='https://github.com/alvations/sacremoses'
license=(MIT)
depends=(
  python-click
  python-joblib
  python-regex
  python-six
  python-tqdm
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('ba2be544dce53b208f925f1f5e9af1efa3fbbfbcc7989130c3abcc6b446c64385421325a5fdbf428100f47661493b126c79d5d153ceb0dd0defbc4ed3dccc8d7')

build() {
  cd "${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
