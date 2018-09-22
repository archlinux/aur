# Maintainer: Clayton Craft <clayton at craftyguy dot net>

pkgname=python-py-spy
pkgver=0.1.8
pkgrel=1
pkgdesc="Sampling profiler for Python programs"
arch=('any')
license=('GPL3')
url="https://github.com/benfred/py-spy"
depends=('python' 'python-setuptools-rust' 'rust')
makedepends=('python-setuptools')

source=("$pkgname-$pkgver.tar.gz::https://github.com/benfred/py-spy/archive/v$pkgver.tar.gz")
sha512sums=('68831d1c066887f3473e9eef1a773c0f9e1eb9252f929b0884b1d04faede90a72d7e3eb949d14e2e75c12e2645bf6b57ea5f94d5514491f46594231ad68ad1d1')

package() {
  cd py-spy-"$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
