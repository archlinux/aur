# Maintainer: Alex Forencich <alex@alexforencich.com>
pkgname=python2-vxi11
pkgver=0.8
pkgrel=1
pkgdesc="A Python VXI-11 driver for controlling instruments over Ethernet."
arch=('any')
url="https://github.com/python-ivi/python-vxi11"
license=('MIT')
depends=('python2')

source=("python-vxi11-$pkgver.tar.gz::https://github.com/python-ivi/python-vxi11/archive/v$pkgver.tar.gz")
md5sums=('46db7d4d6c93ae0bcafd23958010f3df')

build() {
  cd "$srcdir/python-vxi11-$pkgver"
  sed -i "s/'vxi11-cli/'python2-vxi11-cli/" setup.py
}

package() {
  cd "$srcdir/python-vxi11-$pkgver"
  python2 setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
}

