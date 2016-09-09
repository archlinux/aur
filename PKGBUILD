# Maintainer: Cedric Girard <girard.cedric@gmail.com>
_pythonmod=guessit
pkgname=python2-guessit
pkgver=2.1.0
pkgrel=1
pkgdesc="a library for guessing information from video filenames"
arch=('any')
url="http://pypi.python.org/pypi/${_pythonmod}"
license=('GPL3')
replaces=('python2-guessit-rc')
depends=('python2' 'python2-rebulk>=0.7.3' 'python2-babelfish>=0.5.5' 'python2-dateutil')
makedepends=('python2-setuptools')
source=("https://pypi.io/packages/source/${_pythonmod:0:1}/${_pythonmod}/${_pythonmod}-$pkgver.tar.gz")
md5sums=('12c95f8c29541a245e61ca5381a9f50c')

prepare() {
  cd ${srcdir}/${_pythonmod}-$pkgver
  find -type f -exec sed -i '1 s|python$|python2|' {} +
}

build() {
  cd ${srcdir}/${_pythonmod}-$pkgver
  python2 setup.py build
}

package() {
  cd ${srcdir}/${_pythonmod}-$pkgver
  python2 setup.py install --root=${pkgdir}
}
