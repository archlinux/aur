# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=logmerger
pkgver=0.13.0
pkgrel=1
pkgdesc="View multiple log files on one merged timeline"
arch=('any')
url="https://github.com/ptmcg/logmerger"
license=('MIT')
depends=('python' 'python-littletable' 'python-rich' 'python-textual' 'python-typing_extensions')
optdepends=(
  'python-orjson: faster parsing of JSON log lines'
)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/l/logmerger/logmerger-${pkgver}.tar.gz")
sha256sums=('66e97e0db2bda2d97022bb8d730bed730ed8b6b8a0b60e4e70bfe3c2278ecc04')

build() {
  cd "logmerger-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "logmerger-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
