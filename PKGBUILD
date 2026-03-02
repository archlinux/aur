# Maintainer: milops <milops@users.noreply.archlinux.org>
pkgname=nemlai
pkgver=0.1.0
pkgrel=1
pkgdesc="NemlAI CLI client and Python SDK for automated grocery replenishment"
arch=('any')
url="https://nemlai.fly.dev"
license=('MIT')
depends=('python' 'python-httpx')
makedepends=('python-build' 'python-installer' 'python-hatchling')
source=("https://files.pythonhosted.org/packages/source/n/nemlai/nemlai-${pkgver}.tar.gz")
sha256sums=('19a4b914954df6a1be43e73e52161804babbb5279e76e2c1589105396de78e49')

build() {
    cd "${srcdir}/nemlai-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/nemlai-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
