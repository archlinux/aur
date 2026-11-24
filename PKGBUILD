# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=wisdom-tree
pkgver=0.0.20
pkgrel=1
pkgdesc="TUI concentration app with pomodoro timer and lo-fi radio"
arch=('any')
url="https://github.com/truegav/wisdom-tree"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/truegav/wisdom-tree/archive/v${pkgver}.tar.gz")
sha256sums=('9095b0cff2ad8bc31d0b37d2ed22f09621941e481132870fb235f9af6b9a1b16')

build() {
  cd "wisdom-tree-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "wisdom-tree-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
