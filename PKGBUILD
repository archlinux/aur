# Maintainer: Vitaliy VVS Star <vitaliy <dot> star <at> Gmail-DOT-Com>

pkgname=rkn-block-checker
pkgver=0.5.0
pkgrel=2
pkgdesc="Diagnose RKN/TSPU internet blocks layer by layer (DNS, TCP, TLS, HTTP)"
arch=('any')
url="https://github.com/MayersScott/rkn-block-checker"
license=('MIT')
depends=('python>=3.10' 'python-requests')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://github.com/MayersScott/rkn-block-checker/releases/download/v${pkgver}/rkn_block_checker-${pkgver}.tar.gz")
sha256sums=('e25322753f5831882db36426985b90678caec3fd9234d8089187ff0afd4fe1d3')
b2sums=('SKIP')

build() {
  cd "rkn_block_checker-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "rkn_block_checker-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
