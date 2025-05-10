# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=python-dashtable
_name=${pkgname#python-}
pkgver=1.4.5
pkgrel=2
pkgdesc="A library for converting HTML tables into ASCII tables, rowspan and colspan allowed!"
arch=("x86_64")
url="https://github.com/doakey3/DashTable"
license=("MIT")
depends=(python)
conflicts=(python-dashtable2)
makedepends=(python-setuptools python-{build,installer,wheel})
optdepends=(python-docutils python-beautifulsoup4)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('74138dd0bec6044dcab5e64e76140b359cb60f73611e9a8a7b8f814d4769996a')

build() {
  cd ${_name}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd ${_name}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
