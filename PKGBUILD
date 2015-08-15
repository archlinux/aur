# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-pytest-timeout
pkgver=0.5
pkgrel=1
pkgdesc="py.test plugin to abort hanging tests"
arch=('any')
depends=('python2' 'python2-pytest')
makedepends=('python2-setuptools')
url="https://bitbucket.org/flub/pytest-timeout"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/p/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('0c44e5e03b15131498a86169000cb050')
sha256sums=('c42b4106158b43500ea6a433dfee26d1068943ff6673a41e85ea367e38810673')

build() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg2 'Building...'
  python2 setup.py build
}

package() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg2 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1
}
