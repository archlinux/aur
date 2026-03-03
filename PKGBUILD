# Maintainer: NemlAI <aur@nemlai.fly.dev>
pkgname=nemlai
pkgver=0.4.0
pkgrel=1
pkgdesc="CLI and Python SDK for automated grocery replenishment on Nemlig.com (Denmark). Built for OpenClaw and other agents."
arch=('any')
url="https://nemlai.fly.dev"
license=('MIT')
depends=('python' 'python-httpx')
makedepends=('python-build' 'python-installer' 'python-hatchling')
source=("https://files.pythonhosted.org/packages/source/n/nemlai/nemlai-${pkgver}.tar.gz")
sha256sums=('c1e9f03c4a81ce25d3e922f670ac640436ba5c9443a427a3f298714b31ec1f4a')

build() {
  cd "nemlai-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "nemlai-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
