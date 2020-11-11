# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Benjamin A. Shelton <zancarius@gmail.com>
# Contributor: p2k <Patrick.Schneider@uni-ulm.de>

_pypiname=anyjson
pkgname=python-$_pypiname
pkgver=0.3.3
pkgrel=14
pkgdesc="Wraps the best available JSON implementation available in a common interface"
arch=(any)
url="https://pypi.python.org/pypi/$_pypiname"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/a/$_pypiname/$_pypiname-${pkgver}.tar.gz")
md5sums=('2ea28d6ec311aeeebaf993cb3008b27c')

build() {
  cd "$_pypiname-${pkgver}"
  python setup.py build
}

package() {
  cd "$_pypiname-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
