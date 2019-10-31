# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Benjamin A. Shelton <zancarius@gmail.com>
# Contributor: p2k <Patrick.Schneider@uni-ulm.de>

_pypiname=anyjson
pkgbase=python-$_pypiname
pkgname=("python-$_pypiname" "python2-$_pypiname")
pkgver=0.3.3
pkgrel=11
pkgdesc="Wraps the best available JSON implementation available in a common interface"
arch=(any)
url="https://pypi.python.org/pypi/$_pypiname"
license=('BSD')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://files.pythonhosted.org/packages/source/a/$_pypiname/$_pypiname-${pkgver}.tar.gz")
md5sums=('2ea28d6ec311aeeebaf993cb3008b27c')

prepare() {
  cp -a "$_pypiname-${pkgver}" "python2-$_pypiname-${pkgver}"
}

package_python-anyjson() {
  depends=('python')

  cd "$_pypiname-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python2-anyjson() {
  depends=('python2')

  cd "python2-$_pypiname-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
