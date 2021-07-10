# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=zxpy
pkgver=1.4.1
pkgrel=1
pkgdesc="Shell scripts made simple"
arch=('any')
url="https://github.com/tusharsadhwani/zxpy"
license=("MIT")
depends=("python")
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('6d91794d88045d49106364f203d861727301752f1cf4a59971380b8d308c1b0b8862260de45a33adddab443c47c6c14ab608083cad974d6cc1a2d42be337ab72')

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
