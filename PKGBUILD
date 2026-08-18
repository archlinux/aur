# Maintainer: Vitaliy VVS Star <vitaliy <dot> star <at> Gmail-DOT-Com>

pkgname=rkn-block-checker
pkgver=0.5.1
pkgrel=1
pkgdesc="Diagnose RKN/TSPU internet blocks layer by layer (DNS, TCP, TLS, HTTP)"
arch=('any')
url="https://github.com/MayersScott/rkn-block-checker"
license=('MIT')
depends=('python>=3.10' 'python-requests')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://github.com/MayersScott/rkn-block-checker/releases/download/v${pkgver}/rkn_block_checker-${pkgver}.tar.gz")
sha256sums=('3826fe21aff90945707800f7cdc9bc43dacbe762be6491eece78f11d91ea43e0')
b2sums=('e2699d6dde3de10142d250bb31951b8b6850d7381be4a2e6c634d95a2f49dda3651a9d0f788453cb04444e407e883edfe599a425fb0230e080907fab162e60bb')

build() {
  cd "rkn_block_checker-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "rkn_block_checker-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
