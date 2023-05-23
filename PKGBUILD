# Maintainer: LoathingKernel < loathingkernel at gmail dot com >
# Contributor: Antony Lee <anntzer dot lee at gmail dot com>

_pyname=hmmlearn
pkgname=python-$_pyname
pkgver=0.3.0
pkgrel=1
pkgdesc='Hidden Markov Models in Python with scikit-learn like API'
arch=('x86_64')
url='https://hmmlearn.readthedocs.org'
license=('BSD')
depends=('python-scikit-learn')
makedepends=('python-setuptools-scm' 'pybind11')
source=("https://pypi.python.org/packages/source/${_pyname:0:1}/$_pyname/$_pyname-$pkgver.tar.gz")
sha256sums=('d13a91ea3695df881465e3d36132d7eef4e84d483f4ba538a4b46e24b5ea100f')

build() {
  cd "$_pyname-$pkgver"
  python setup.py build
}

package() {
  cd "$_pyname-$pkgver"
  python setup.py install --skip-build --prefix=/usr --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
