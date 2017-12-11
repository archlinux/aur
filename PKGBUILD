# Maintainer: Cedric Girard <girard.cedric@gmail.com>
_pythonmod=guessit
pkgname=('python-guessit-204' 'python2-guessit-204')
pkgbase=python-guessit-204
pkgver=2.0.4
pkgrel=1
pkgdesc="a library for guessing information from video filenames"
arch=('any')
url="http://pypi.python.org/pypi/${_pythonmod}"
license=('GPL3')
source=("https://pypi.io/packages/source/${_pythonmod:0:1}/${_pythonmod}/${_pythonmod}-$pkgver.tar.gz")
md5sums=('2fc60912f7a12ca9573e265de23556d6')


package_python2-guessit-204() {
  provides=('python2-guessit=2.0.4')
  conflicts=('python2-guessit=2.0.4')
  depends=('python2' 'python2-rebulk>=0.7.0' 'python2-babelfish>=0.5.5' 'python2-dateutil')
  cd ${srcdir}/${_pythonmod}-$pkgver
  python2 setup.py install --root=${pkgdir}

  #rename binary to avoid conflict with Python3 version
  mv ${pkgdir}/usr/bin/guessit{,2}
}

package_python-guessit-204() {
  provides=('python-guessit=2.0.4')
  conflicts=('python-guessit=2.0.4')
  depends=('python' 'python-rebulk>=0.7.0' 'python-babelfish>=0.5.5' 'python-dateutil')
  cd ${srcdir}/${_pythonmod}-$pkgver
  python setup.py install --root=${pkgdir}
}
