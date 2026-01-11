# Maintainer: Christos Longros <chris.longros@gmail.com>
pkgname=python-fsrs
pkgver=6.3.0
pkgrel=1
pkgdesc="Free Spaced Repetition Scheduler - Python implementation"
arch=('any')
url="https://github.com/open-spaced-repetition/py-fsrs"
license=('MIT')
depends=('python' 'python-typing_extensions')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/f/fsrs/fsrs-${pkgver}.tar.gz")
sha256sums=('3abbafd66469ebf58d35a5d5bb693a492e1db44232e09aa8e4d731bf047cd0ae')

build() {
  cd "fsrs-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "fsrs-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
