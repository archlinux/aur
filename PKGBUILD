# Maintainer: Ryan Gonzalez <rymg19@gmail.com>

pkgname=('python-plac' 'python2-plac')
pkgver=0.9.6
pkgrel=1
pkgdesc='The smartest command line arguments parser in the world'
arch=('any')
url='https://github.com/micheles/plac'
license=('BSD')
makedepends=('python-setuptools' 'python2-setuptools')
source=(https://pypi.org/packages/source/p/plac/plac-$pkgver.tar.gz)
sha256sums=('ba3f719a018175f0a15a6b04e6cc79c25fd563d348aacd320c3644d2a9baf89b')


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
