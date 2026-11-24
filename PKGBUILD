# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=asciimol
pkgver=1.2.7
pkgrel=1
pkgdesc="Curses-based ASCII molecule viewer"
arch=('any')
url="https://github.com/dewberryants/asciimol"
license=('BSD-2-Clause')
depends=('python' 'python-numpy')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/a/asciimol/asciimol-${pkgver}.tar.gz")
sha256sums=('4aac1588e9d5c754dca58f0a7795500a0d40f0a4270612fc6aaf46b2bc1eaf79')

build() {
  cd "asciimol-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "asciimol-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
