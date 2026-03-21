# Maintainer: Christos Longros <chris.longros@gmail.com>
pkgname=python-fsrs
pkgver=6.3.1
pkgrel=1
pkgdesc="Free Spaced Repetition Scheduler - Python implementation"
arch=('any')
url="https://github.com/open-spaced-repetition/py-fsrs"
license=('MIT')
depends=('python' 'python-typing_extensions')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/f/fsrs/fsrs-${pkgver}.tar.gz")
sha256sums=('43c5c6056b97266baf6ebfef9e4cadeb9ac5a4e1b29ffdfb300f445b6e6b15ca')

build() {
  cd "fsrs-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "fsrs-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
