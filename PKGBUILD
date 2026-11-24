# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=usolitaire
pkgver=1.1.0
pkgrel=1
pkgdesc="Solitaire in the terminal"
arch=('any')
url="https://github.com/eliasdorneles/usolitaire"
license=('MIT')
depends=('python' 'python-textual')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/u/usolitaire/usolitaire-${pkgver}.tar.gz")
sha256sums=('b5e414a54f61fa6e0b8553946bfce093a20e79019138d98bbe93b1a7b76354df')

build() {
  cd "usolitaire-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "usolitaire-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
