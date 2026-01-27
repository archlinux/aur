# Maintainer: Markus Näther <naether.markus@gmail.com>

pkgname=python-simple_parsing
pkgver=0.1.8
pkgrel=2
pkgdesc="Simple, Elegant, Typed Argument Parsing with argparse"
arch=('any')
url="https://github.com/lebrice/SimpleParsing"
license=('MIT')
depends=(
  'python'
  'python-pyyaml'
)
makedepends=(python-build python-installer python-wheel python-setuptools python-uv-build python-uv-dynamic-versioning)
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/lebrice/SimpleParsing/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=(
  '8e23c5dc095e0f30fdb3947a8c1bdaf05c2ce394887b5aa2c460d12a9ffeb98e'
)

build () {
  cd "SimpleParsing-${pkgver}"
  uv build --wheel --no-build-isolation
}

package() {
  cd "SimpleParsing-${pkgver}"
    
  python -m installer --destdir="$pkgdir" dist/*.whl
    
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
