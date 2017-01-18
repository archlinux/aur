# Maintainer: Alex Forencich <alex@alexforencich.com>
pkgname=(python-vxi11 python2-vxi11)
pkgver=0.9
pkgrel=1
pkgdesc="A Python VXI-11 driver for controlling instruments over Ethernet."
arch=('any')
url="https://github.com/python-ivi/python-vxi11"
license=('MIT')

source=("python-vxi11-$pkgver.tar.gz::https://github.com/python-ivi/python-vxi11/archive/v$pkgver.tar.gz")
sha256sums=('0a342c5bee00d1af9456b2a18d75adb60171feba0a98399fb3938e6f64348427')

package_python-vxi11() {
  depends=('python')

  cd "$srcdir/python-vxi11-$pkgver"
  sed -i "s/'.*-cli/'python-vxi11-cli/" setup.py
  python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
  cd "$pkgdir/usr/bin"
  ln -s python-vxi11-cli vxi11-cli
}

package_python2-vxi11() {
  depends=('python2')

  cd "$srcdir/python-vxi11-$pkgver"
  sed -i "s/'.*-cli/'python2-vxi11-cli/" setup.py
  python2 setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
}

