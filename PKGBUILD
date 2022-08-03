# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python2-lazy-object-proxy
pkgver=1.6.0
pkgrel=2
pkgdesc='A fast and thorough lazy object proxy'
arch=('x86_64')
url="https://github.com/ionelmc/python-lazy-object-proxy"
license=('BSD')
makedepends=('python2-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ionelmc/python-lazy-object-proxy/archive/v$pkgver.tar.gz")
sha512sums=('08fd5e76a6e892a9390ae3bc3025c2fe9255437823fba9aa804f2c7cac09c5f9b57c791d3c9b137aa96c4c78fc2c494eca629cc60d21d23d59713f7a418491a1')

build() {
  cd "$srcdir"/python-lazy-object-proxy-$pkgver
  python2 setup.py build
}

package_python2-lazy-object-proxy() {
  depends=("python2")

  cd python-lazy-object-proxy-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
