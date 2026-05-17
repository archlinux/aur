pkgname=python312-nodeenv
pkgver=1.10.0
pkgrel=1
pkgdesc='Node.js virtual environment builder for Python 3.12'
arch=('any')
url='https://github.com/ekalinin/nodeenv'
license=('BSD')
depends=('python312')
makedepends=('python312-installer')
source=("nodeenv-1.10.0-py2.py3-none-any.whl::https://files.pythonhosted.org/packages/88/b2/d0896bdcdc8d28a7fc5717c305f1a861c26e18c05047949fb371034d98bd/nodeenv-1.10.0-py2.py3-none-any.whl")
sha256sums=('5bb13e3eed2923615535339b3c620e76779af4cb4c6a90deccc9e36b274d3827')

package() {
  python3.12 -m installer --destdir="$pkgdir" "$srcdir/nodeenv-1.10.0-py2.py3-none-any.whl"
  rm -f "$pkgdir/usr/bin/nodeenv"
  rmdir --ignore-fail-on-non-empty "$pkgdir/usr/bin"
}
