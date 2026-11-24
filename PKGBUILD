# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=gruyere
pkgver=0.1.1
pkgrel=1
pkgdesc="View and kill processes listening on ports"
arch=('any')
url="https://github.com/savannahostrowski/gruyere"
license=('MIT')
depends=('python' 'python-psutil' 'python-readchar' 'python-rich' 'python-typer')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
source=("https://files.pythonhosted.org/packages/source/g/gruyere/gruyere-${pkgver}.tar.gz")
sha256sums=('de848e041a461629b9e76c5b6118c1ac84e0f4faa2cd14dc4b390298ea49a32e')

build() {
  cd "gruyere-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "gruyere-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
