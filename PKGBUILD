# Maintainer: Clayton Craft <clayton at craftyguy dot net>

pkgname=python-py-spy
pkgver=0.1.4
pkgrel=1
pkgdesc="Sampling profiler for Python programs"
arch=('any')
license=('GPL3')
url="https://github.com/benfred/py-spy"
depends=('python' 'python-setuptools-rust' 'rust')
makedepends=('python-setuptools')

source=("$pkgname-$pkgver.tar.gz::https://github.com/benfred/py-spy/archive/v$pkgver.tar.gz")
sha512sums=('fee04d9f874ba1c30963c0b95e4df73ab7af4075e28dbb0d4380f5b8714fff1a0e6426366264666c1a9eb9117ebd9c07c478db1a0475e4de83053aa16ecb86f9')

package() {
  cd py-spy-"$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
