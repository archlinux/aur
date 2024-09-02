# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=findimports
pkgver=2.5.0
pkgrel=1
pkgdesc="Python module import analysis tool"
url="https://github.com/mgedmin/findimports"
depends=('python')
makedepends=('python-setuptools')
license=('GPL')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('c2d0705dc75fed68af32180225c95277d4f3d299d901e8f68873c28a6f073c33')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./testsuite.py
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
