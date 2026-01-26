# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=python-bencoding
_pkgname=${pkgname#python-}
pkgver=0.2.6
pkgrel=1
pkgdesc='BCODE for Python3'
arch=(any)
url='https://pypi.org/project/bencoding'
license=('MIT')
depends=(python)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
options=(!debug)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('43cce31d4863e29d6bc611551d4e9f2652be2995e9d5e15b46d8383f180d4440')

build() {
  cd "${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
