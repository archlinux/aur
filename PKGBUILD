# Maintainer: LoathingKernel < loathingkernel at gmail dot com >
# Contributor: Antony Lee <anntzer dot lee at gmail dot com>

_pyname=hmmlearn
pkgname=python-$_pyname
pkgver=0.2.1
pkgrel=1
pkgdesc='Hidden Markov Models in Python with scikit-learn like API'
arch=('x86_64')
url='http://hmmlearn.readthedocs.org'
license=('BSD')
depends=('python-scikit-learn')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/${_pyname:0:1}/$_pyname/$_pyname-$pkgver.tar.gz")
md5sums=('9e21f8b671b879be997cbeab8cbf7145')

build() {
  cd "$_pyname-$pkgver"
  python setup.py build
}

package() {
  cd "$_pyname-$pkgver"
  python setup.py install --skip-build --prefix=/usr --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
