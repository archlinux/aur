# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=kanban-python
pkgver=0.6.4
pkgrel=1
pkgdesc="Kanban board for the terminal"
arch=('any')
url="https://github.com/zaloog/kanban-python"
license=('MIT')
depends=('python' 'python-platformdirs' 'python-rich')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
source=("https://files.pythonhosted.org/packages/source/k/kanban_python/kanban_python-${pkgver}.tar.gz")
sha256sums=('cf818fceabd60185a777896b7d852ab04454ef852d26ae726aa620ed2035f99d')

build() {
  cd "kanban_python-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "kanban_python-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
