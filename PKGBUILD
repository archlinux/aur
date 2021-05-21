# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=zxpy
pkgver=1.2.3
pkgrel=1
pkgdesc="Shell scripts made simple"
arch=('any')
url="https://github.com/tusharsadhwani/zxpy"
license=("MIT")
depends=("python")
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('db002d28f5eb503e63fe3e652a7702f3a602001fe7b3b58097c38641fa4ba42d039bdb2427af42812852aa43205117d1ad403abaaab771dbd38c474ba113503e')

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
