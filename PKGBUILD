# Maintainer: Kyle Keen <keenerd@gmail.com>

pkgname=python2-jupyter_client
pkgver=5.3.4
pkgrel=4
pkgdesc="Jupyter protocol implementation and client libraries"
arch=('any')
url="https://pypi.python.org/pypi/jupyter_client"
license=('BSD')
depends=('python2-ipykernel' 'python2-traitlets' 'python2-pyzmq'
         'python2-jupyter_core' 'python2-dateutil')
makedepends=('python2-setuptools')
source=("$pkgbase-$pkgver.tgz::https://github.com/jupyter/jupyter_client/archive/$pkgver.tar.gz")
md5sums=('973df8f9aa47a15d3cd7f9cc9fa4aa82')

# dep cycle with python-ipykernel

build() {
  cd "$srcdir"
}

package() {
  cd "$srcdir/jupyter_client-$pkgver"
  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=0
  install -Dm644 COPYING.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  cd "$pkgdir/usr"
  rm bin/jupyter-*
  rmdir bin
}

