# Maintainer: Alex Forencich <alex@alexforencich.com>
pkgname=python-vxi11
pkgver=0.9
pkgrel=2
pkgdesc="A Python VXI-11 driver for controlling instruments over Ethernet."
arch=('any')
url="https://github.com/python-ivi/python-vxi11"
license=('MIT')
depends=('python' 'python-standard-xdrlib')
makedepends=('python-setuptools')
source=("python-vxi11-$pkgver.tar.gz::https://github.com/python-ivi/python-vxi11/archive/v$pkgver.tar.gz")
sha256sums=('0a342c5bee00d1af9456b2a18d75adb60171feba0a98399fb3938e6f64348427')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}
package() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

}
