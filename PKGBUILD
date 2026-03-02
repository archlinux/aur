# Maintainer: NemlAI <aur@nemlai.fly.dev>
pkgname=nemlai
pkgver=0.2.0
pkgrel=1
pkgdesc="NemlAI CLI client and Python SDK for automated grocery replenishment"
arch=('any')
url="https://nemlai.fly.dev"
license=('MIT')
depends=('python' 'python-httpx')
makedepends=('python-build' 'python-installer' 'python-hatchling')
source=("https://pypi.org/packages/source/n/nemlai/nemlai-${pkgver}.tar.gz")
sha256sums=('2ffe7297eb8d621819ce90d4e46121cfd5c07b37038b5f0629256a112d574383')

build() {
  cd "nemlai-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "nemlai-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
