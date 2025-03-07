# Maintainer: redponike <proton (dot) me>
# Contributor: Wu Zhenyu <wuzhenyu@ustc.edu>

_pkgname=x_transformers
pkgname=python-x-transformers
pkgver=2.1.5
pkgrel=1
pkgdesc="A concise but complete full-attention transformer with a set of promising experimental features from various papers"
arch=('x86_64')
url=https://github.com/lucidrains/x-transformers
depends=(python-einops python-einx python-pytorch python-packaging python-loguru)
makedepends=(python-installer python-build python-wheel)
license=('MIT')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('b88887175d1e6aa81965a1225ef117e810a45ac408f7dbdc3b04bdf50dac7f13')

build() {
  cd "${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
