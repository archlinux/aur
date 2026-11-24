# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=pingtop-py
pkgver=0.5.1
pkgrel=1
pkgdesc="Ping multiple servers and show results in a top-like TUI"
arch=('any')
url="https://github.com/laixintao/pingtop"
license=('MIT')
depends=('python' 'python-click' 'python-textual')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-poetry-core')
conflicts=('pingtop' 'pingtop-bin')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/laixintao/pingtop/archive/v${pkgver}.tar.gz")
sha256sums=('6cdfcd71c7f306a8ac47d273fa866b144655a5de8640d39a4d2b20e367b70b79')

build() {
  cd "pingtop-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "pingtop-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
