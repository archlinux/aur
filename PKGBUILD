# Maintainer: Christos Longros <chris.longros@gmail.com>
pkgname=python-fsrs
pkgver=6.3.2
pkgrel=1
pkgdesc="Free Spaced Repetition Scheduler - Python implementation"
arch=('any')
url="https://github.com/open-spaced-repetition/py-fsrs"
license=('MIT')
depends=('python' 'python-typing_extensions')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/f/fsrs/fsrs-${pkgver}.tar.gz")
sha256sums=('7fe79947ceb92ca35fdca3dfa511a239be15b317cde63d6643a2da6110844d91')

build() {
  cd "fsrs-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "fsrs-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
