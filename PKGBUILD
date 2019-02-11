# Maintainer: Ryan Gonzalez <rymg19@gmail.com>

pkgname=('python-plac' 'python2-plac')
pkgver=1.0.0
pkgrel=1
pkgdesc='The smartest command line arguments parser in the world'
arch=('any')
url='https://github.com/micheles/plac'
license=('BSD')
makedepends=('python-setuptools' 'python2-setuptools')
source=(https://pypi.org/packages/source/p/plac/plac-$pkgver.tar.gz)
sha256sums=('b03f967f535b3bf5a71b191fa5eb09872a5cfb1e3b377efc4138995e10ba36d7')


package_python-plac() {
  depends=('python-setuptools')
  cd "$srcdir/plac-$pkgver"
  python3 setup.py install --root="$pkgdir" -O1
}

package_python2-plac() {
  depends=('python2-setuptools')
  cd "$srcdir/plac-$pkgver"
  python2 setup.py install --root="$pkgdir" -O1
  rm "$pkgdir/usr/bin/plac_runner.py"
}
