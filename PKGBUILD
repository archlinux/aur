# Maintainer: NemlAI <aur@nemlai.fly.dev>
pkgname=nemlai
pkgver=0.3.0
pkgrel=1
pkgdesc="CLI and Python SDK for automated grocery replenishment on Nemlig.com (Denmark). Built for OpenClaw and other agents."
arch=('any')
url="https://nemlai.fly.dev"
license=('MIT')
depends=('python' 'python-httpx')
makedepends=('python-build' 'python-installer' 'python-hatchling')
source=("https://files.pythonhosted.org/packages/source/n/nemlai/nemlai-${pkgver}.tar.gz")
sha256sums=('31db14f152939de4cba767c4d3951480d913fc58c9e7898d0acc410c7e3b8421')

build() {
  cd "nemlai-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "nemlai-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
