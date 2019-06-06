# Maintainer: Luis Aranguren <pizzaman@hotmail.com>

pkgname=python-helpdev
_name=helpdev
pkgver=0.6.10
pkgrel=1
pkgdesc="Extracts information about the Python environment easily."
arch=('any')
depends=('python' 'python-importlib-metadata')
makedepends=('python-setuptools')
url="https://gitlab.com/dpizetta/helpdev"
license=('MIT')
options=('!emptydirs')
source=($pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha256sums=('9e61d24458b7506809670222ca656b139e67d46c530cd227a899780152d7b44e')

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
