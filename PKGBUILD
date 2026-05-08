# Maintainer: Vitaliy VVS Star <vitaliy <dot> star <at> Gmail-DOT-Com>

pkgname=rkn-block-checker
pkgver=0.4.0
pkgrel=1
pkgdesc="Diagnose RKN/TSPU internet blocks layer by layer (DNS, TCP, TLS, HTTP)"
arch=('any')
url="https://github.com/MayersScott/rkn-block-checker"
license=('MIT')
depends=('python>=3.10' 'python-requests')
makedepends=('python-setuptools' 'python-wheel')
source=("https://github.com/MayersScott/rkn-block-checker/releases/download/v${pkgver}/rkn_block_checker-${pkgver}.tar.gz")
sha256sums=('4ce4e9958de6c92ed434a52a1a9379502374c9d9c1af8ed6e4112c36f59e87f9')
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
