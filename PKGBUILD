# Maintainer: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Thomas S Hatch <thatch45@gmail.com>

pkgname=('python-ioflo' 'python2-ioflo')
pkgver=1.3.9
pkgrel=2
pkgdesc='Flo based programming interface in python'
arch=('any')
url='http://ioflo.com'
license=('APACHE')
source=("https://pypi.python.org/packages/source/i/ioflo/ioflo-$pkgver.tar.gz")
md5sums=('066639d2e6e26536534f8dcb23481c3a')
makedepends=(python-setuptools python2-setuptools)

prepare() {
  cd $srcdir
  cp -r ioflo-$pkgver python2-ioflo-$pkgver
}

package_python-ioflo() {
  depends=('python')
  cd "$srcdir/ioflo-$pkgver"
  python3 setup.py install --root="$pkgdir" -O1
}

package_python2-ioflo() {
  depends=('python2')
  cd "$srcdir/python2-ioflo-$pkgver"
  python2 setup.py install --root="$pkgdir" -O1
}

