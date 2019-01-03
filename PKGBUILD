# Maintainer: Leo Mao <leomaoyw at gmail dot com>
pkgname=python-pymanopt
_pkgname=pymanopt
_commit=8b8c30f3bdd2fb9548fa800ce34036c984e7e75c
pkgver=0.2.3
pkgrel=1
pkgdesc="Python toolbox for optimization on manifolds with support for automatic differentiation"
_pypiname="pymanopt"
#_github="pymanopt/pymanopt"
url="https://pymanopt.github.io"
arch=('x86_64')
license=('MIT')
depends=('python-numpy' 'python-scipy')
optdepends=('python-tensorflow' 'python-autograd' 'python-theano')
makedepends=('python' 'python-setuptools')
source=("https://github.com/pymanopt/pymanopt/archive/$_commit.tar.gz")
md5sums=('649e66abd690ada18935d6441ba5c578')

build() {
  cd "$srcdir/$_pkgname-$_commit"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$_commit"
  python setup.py install --skip-build --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
