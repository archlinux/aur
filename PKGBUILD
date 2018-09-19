# Maintainer: Clayton Craft <clayton at craftyguy dot net>

pkgname=python-py-spy
pkgver=0.1.6
pkgrel=1
pkgdesc="Sampling profiler for Python programs"
arch=('any')
license=('GPL3')
url="https://github.com/benfred/py-spy"
depends=('python' 'python-setuptools-rust' 'rust')
makedepends=('python-setuptools')

source=("$pkgname-$pkgver.tar.gz::https://github.com/benfred/py-spy/archive/v$pkgver.tar.gz")
sha512sums=('056abe52a2cf3df33a5830bcb8537fb8f4e992e99f9c8f821050be270489a195805a4eb28d8797016e238eb04d66d140af864cfb2a27431b91455e1b33fda7f9')

package() {
  cd py-spy-"$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
