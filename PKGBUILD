# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=gex-terminal
pkgver=0.6.0
pkgrel=1
pkgdesc="Terminal UI for intraday gamma exposure and market structure"
arch=('any')
url="https://github.com/zrack/gex-terminal"
license=('MIT')
depends=('python' 'python-aiohttp' 'python-dotenv' 'python-numpy' 'python-textual' 'python-websockets')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/zrack/gex-terminal/archive/v${pkgver}.tar.gz")
sha256sums=('dee9463f6d71c36ed1e400750a72300f8560e2cf66841878345685517598e50c')

build() {
  cd "gex-terminal-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "gex-terminal-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
