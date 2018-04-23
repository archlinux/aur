# Maintainer: Eugene Dvoretsky <radioxoma at gmail dot com>

_pyname=hmmlearn
pkgname=python2-$_pyname
pkgver=0.2.0
pkgrel=1
pkgdesc='Hidden Markov Models in Python with scikit-learn like API'
url='http://hmmlearn.readthedocs.org'
depends=('python2-scikit-learn')
provides=('python2-hmmlearn-git')
license=('BSD')
arch=('i686' 'x86_64')
source=("https://pypi.python.org/packages/source/${_pyname:0:1}/$_pyname/$_pyname-$pkgver.tar.gz")
md5sums=('929acdbe7c97a2fed65bd3bbff516810')

build() {
  cd $srcdir/$_pyname-$pkgver
  python2 setup.py build
}

package() {
  cd $srcdir/$_pyname-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
