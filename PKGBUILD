# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=jupyterlab-execute-time
_pypi=jupyterlab_execute_time
pkgdesc="JupyterLab extension to show execution time for each cell"
url='https://github.com/deshaw/jupyterlab-execute-time'
pkgver=2.0.5
pkgrel=1
license=('BSD')
arch=('any')
makedepends=('python-jupyter_packaging' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/j/$_pypi/$_pypi-$pkgver.tar.gz")
sha256sums=('7d1417747362ace7e140951cff276f247e89b9dfd5387483705ffdfcccbcf6e8')

build() {
  cd "$_pypi-$pkgver"
  python setup.py build
}

package() {
  cd "$_pypi-$pkgver"
  python setup.py install --skip-build --optimize=1 --root="$pkgdir"
  install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname"
}
