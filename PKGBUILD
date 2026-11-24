# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=pythonlings
pkgver=0.4.4
pkgrel=1
pkgdesc="Rustlings-style Python exercises in a terminal UI"
arch=('any')
url="https://github.com/abhiksark/pythonlings"
license=('MIT')
depends=('python' 'python-textual')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
source=("https://files.pythonhosted.org/packages/source/p/pythonlings/pythonlings-${pkgver}.tar.gz")
sha256sums=('be8a1ebb321fb4da6ca41b1c580a690b7b9ea26e3bbfc93068e4569427e9d785')

build() {
  cd "pythonlings-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "pythonlings-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
