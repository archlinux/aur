# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-cython-test-exception-raiser
pkgver=1.0.2
pkgrel=3
pkgdesc="A trivial extension that just raises an exception"
url="https://github.com/twisted/cython-test-exception-raiser"
license=('MIT')
arch=('x86_64')
depends=('python38')
makedepends=('python38-setuptools' 'python38-cython')
source=("https://github.com/twisted/cython-test-exception-raiser/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('ad245eb87fe2d4d93d244b125d80f17fe6deeac86ae9a9129d211d9ff1738da39dc30d49a80f33d50a6fa52029403018c87a8637db9c21098ef8b0e3afe20ea7')

build() {
  cd cython-test-exception-raiser-$pkgver
  python3.8 setup.py build
}

package() {
  cd cython-test-exception-raiser-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
