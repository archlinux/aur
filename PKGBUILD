# Maintainer: LoathingKernel < loathingkernel at gmail dot com >
# Contributor: Antony Lee <anntzer dot lee at gmail dot com>

_pyname=hmmlearn
pkgname=python-$_pyname
pkgver=0.2.4
pkgrel=1
pkgdesc='Hidden Markov Models in Python with scikit-learn like API'
arch=('x86_64')
url='http://hmmlearn.readthedocs.org'
license=('BSD')
depends=('python-scikit-learn')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/${_pyname:0:1}/$_pyname/$_pyname-$pkgver.tar.gz")
sha256sums=('0f5cb598a7494b9703c6188246dc89e529d46cbb6700eca70cc895085f0b3cc3')

build() {
  cd "$_pyname-$pkgver"
  python setup.py build
}

package() {
  cd "$_pyname-$pkgver"
  python setup.py install --skip-build --prefix=/usr --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
