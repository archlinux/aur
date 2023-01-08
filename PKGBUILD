# Maintainer: Leo Mao <leomaoyw at gmail dot com>
pkgname=python-pymanopt
_pkgname=pymanopt
pkgver=2.1.1
pkgrel=1
pkgdesc="Python toolbox for optimization on manifolds with support for automatic differentiation"
_pypiname="pymanopt"
#_github="pymanopt/pymanopt"
url="https://pymanopt.github.io"
arch=('x86_64')
license=('MIT')
depends=('python-numpy' 'python-scipy')
optdepends=('python-tensorflow' 'python-autograd')
makedepends=('python' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pymanopt/pymanopt/archive/$pkgver.tar.gz")
md5sums=('9981b30b21ef1da6265dbcb193c2e50c')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --skip-build --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
