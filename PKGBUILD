# Maintainer: NemlAI <aur@nemlai.fly.dev>
pkgname=nemlai
pkgver=0.4.1
pkgrel=1
pkgdesc="CLI and Python SDK for automated grocery replenishment on Nemlig.com (Denmark). Built for OpenClaw and other agents."
arch=('any')
url="https://nemlai.fly.dev"
license=('MIT')
depends=('python' 'python-httpx')
makedepends=('python-build' 'python-installer' 'python-hatchling')
source=("https://files.pythonhosted.org/packages/source/n/nemlai/nemlai-${pkgver}.tar.gz")
sha256sums=('2528b6ffd9b71cf07b10ffaf850e2eeec445e68b8f99c2b25bfb2ce9aebfe86f')

build() {
  cd "nemlai-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "nemlai-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
