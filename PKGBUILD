# Maintainer: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Thomas S Hatch <thatch45@gmail.com>

pkgname=('python-ioflo' 'python2-ioflo')
pkgver=1.4.9
pkgrel=1
pkgdesc='Flo based programming interface in python'
arch=('any')
url='http://ioflo.com'
license=('APACHE')
source=("https://pypi.python.org/packages/source/i/ioflo/ioflo-$pkgver.tar.gz")
md5sums=('f37b7958f8e7fc9cf01a1213c2d15283')
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
  mv $pkgdir/usr/bin/ioflo $pkgdir/usr/bin/ioflo2
}

