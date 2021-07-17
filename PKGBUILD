# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=zxpy
pkgver=1.4.3
pkgrel=1
pkgdesc="Shell scripts made simple"
arch=('any')
url="https://github.com/tusharsadhwani/zxpy"
license=("MIT")
depends=("python")
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('9d5b7fb3e37d5af0b449306bd05ae80344f89a0f348541f81af0866778c76b93aee0fc80e1b6f3d3bd334eb308b3bf2f24802f33577e9e040323a762fc54ce81')

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$pkgname-$pkgver"
  export PYTHONHASHSEED=0
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
