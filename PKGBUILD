# Maintainer: Ryan Gonzalez <rymg19@gmail.com>

pkgname=('python-plac' 'python2-plac')
pkgver=1.1.0
pkgrel=1
pkgdesc='The smartest command line arguments parser in the world'
arch=('any')
url='https://github.com/micheles/plac'
license=('BSD')
makedepends=('python-setuptools' 'python2-setuptools')
source=(https://pypi.org/packages/source/p/plac/plac-$pkgver.tar.gz)
sha256sums=('7c16cfa7422a76b7525fc93d0be5c9c9a2d5250083e80ddac6621edb395dc081')


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
