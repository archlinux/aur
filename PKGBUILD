# Maintainer: xsmile <sascha_r gmx de>

pkgname=('python-bittrex' 'python2-bittrex')
_pkgname=${pkgname[0]}
pkgver=0.2.2
pkgrel=1
pkgdesc='Python bindings for bittrex'
url='https://github.com/ericsomdahl/python-bittrex'
license=('MIT')
arch=('any')
source=("$url/archive/v$pkgver.tar.gz")
md5sums=('b4499255d2498b266416b0f063397b86')

package_python-bittrex() {
  depends=('python-requests')
  makedepends=('python-setuptools')

  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/${pkgname[0]}"
}

package_python2-bittrex() {
  depends=('python2-requests')
  makedepends=('python2-setuptools')

  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/${pkgname[1]}"
}
