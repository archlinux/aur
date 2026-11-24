# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=python-littletable
pkgver=3.0.2
pkgrel=1
pkgdesc="In-memory ORM database for Python"
arch=('any')
url="https://github.com/ptmcg/littletable"
license=('MIT')
depends=('python')
optdepends=(
  'python-rich: rich table output'
  'python-pandas: import and export with pandas'
)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/l/littletable/littletable-${pkgver}.tar.gz")
sha256sums=('6c3c310344e0105eb5ca882443977d7aba83095daa25562af4621c95a5ea67ae')

build() {
  cd "littletable-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "littletable-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
