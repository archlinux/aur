# Maintainer: Daniel Maslowski <info@orangecms.org>

_pyname=conda-package-handling
pkgname=python-${_pyname}
pkgver=1.3.4
pkgrel=1
pkgdesc="Create and extract conda package of various formats"
arch=('any')
url="https://github.com/conda/conda-package-handling"
license=('BSD')
depends=(
  'python'
  'python-conda'
  'python-six'
)
options=(!emptydirs)
install=
source=(https://github.com/conda/$_pyname/archive/$pkgver.tar.gz)
sha512sums=('d5600de39f23bd9fa7aee2eb46ae976dfdb3eddbcd992b59e6e73a9a6ea75f58204c63a697886b93b0f8300245446d3b9bf15a12eec8318553c8170c45facf7e')

package() {
  cd "$srcdir/${_pyname}-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
