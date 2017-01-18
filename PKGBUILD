# Maintainer: Alex Forencich <alex@alexforencich.com>
pkgname=(python-usbtmc python2-usbtmc)
pkgver=0.8
pkgrel=1
pkgdesc="A Python USBTMC driver for controlling instruments over USB."
arch=('any')
url="https://github.com/python-ivi/python-usbtmc"
license=('MIT')

source=("python-usbtmc-$pkgver.tar.gz::https://github.com/python-ivi/python-usbtmc/archive/v$pkgver.tar.gz")
sha256sums=('dc13aa4ae0c0e4545e2ef83ae181d08528de176ee1522e6d66856449cf91c491')

package_python-usbtmc() {
  depends=('python' 'python-pyusb')

  cd "$srcdir/python-usbtmc-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1

  install -m 0644 -D usbtmc.rules $pkgdir/etc/udev/rules.d/40-usbtmc.rules
}

package_python2-usbtmc() {
  depends=('python2' 'python2-pyusb')

  cd "$srcdir/python-usbtmc-$pkgver"
  python2 setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
}
