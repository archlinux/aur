# Maintainer: Cedric Girard <girard.cedric@gmail.com>
_pythonmod=guessit
pkgname=python2-guessit-rc
pkgver=2.0.5
pkgrel=1
pkgdesc="a library for guessing information from video filenames"
arch=('any')
url="http://pypi.python.org/pypi/${_pythonmod}"
license=('GPL3')
provides=("python2-guessit=${pkgver}")
conflicts=('python2-guessit' 'pythton2-guessit-git')
depends=('python2' 'python2-rebulk>=0.7.1' 'python2-regex' 'python2-babelfish>=0.5.5' 'python2-dateutil<2.5.2')
makedepends=('python2-setuptools')
source=("https://pypi.python.org/packages/source/${_pythonmod:0:1}/${_pythonmod}/${_pythonmod}-$pkgver.tar.gz")
md5sums=('6afe4e2e37cd66cde465d7df6fd50203')

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
