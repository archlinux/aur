
# Maintainer: Donald Webster <fryfrog@gmail.com>
# Contributor: Marcus Hoffmann <bubu@bubu1.eu>
# Contributor: Sonic-Y3k <sonic.y3k@googlemail.com>

pkgname=python-ua-parser
_name=ua_parser
pkgver=1.0.2
pkgrel=1
pkgdesc="Python port of Browserscope's user agent parser"
arch=('any')
url="https://pypi.python.org/pypi/ua-parser"
license=('MIT')
makedepends=(python-build python-installer python-wheel python-setuptools)
depends=('python' 'python-pyaml')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('bab404ad42fb37f943107da2f6003ffc79724d11cc95076a7a539513371779da')

build() {
  cd $srcdir/${_name}-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/${_name}-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
