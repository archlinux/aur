# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=ghostcfg
pkgver=0.1.4
pkgrel=1
pkgdesc="Interactive TUI for editing Ghostty configuration"
arch=('any')
url="https://github.com/samkleespies/ghostcfg"
license=('MIT')
depends=('python' 'python-textual')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
source=("https://files.pythonhosted.org/packages/source/g/ghostcfg/ghostcfg-${pkgver}.tar.gz")
sha256sums=('e6ffe1bb946aa384edd3d45fc813a49dcb918775def689eec96ec47862131591')

build() {
  cd "ghostcfg-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "ghostcfg-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
