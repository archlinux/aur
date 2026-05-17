pkgname=python312-build
_name=build
pkgver=1.3.0
pkgrel=1
pkgdesc='A simple, correct Python build frontend for Python 3.12'
arch=('any')
url='https://github.com/pypa/build'
license=('MIT')
depends=('python312' 'python312-packaging' 'python312-pyproject-hooks')
makedepends=('python312-installer')
source=("build-1.3.0-py3-none-any.whl::https://files.pythonhosted.org/packages/cb/8c/2b30c12155ad8de0cf641d76a8b396a16d2c36bc6d50b621a62b7c4567c1/build-1.3.0-py3-none-any.whl")
sha256sums=('7145f0b5061ba90a1500d60bd1b13ca0a8a4cebdd0cc16ed8adf1c0e739f43b4')

package() {
  python3.12 -m installer --destdir="$pkgdir" "$srcdir/build-1.3.0-py3-none-any.whl"

  rm -f "$pkgdir/usr/bin/pyproject-build"
  rmdir --ignore-fail-on-non-empty "$pkgdir/usr/bin"
}
