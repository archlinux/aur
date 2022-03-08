# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=zxpy
pkgver=1.6.0
pkgrel=1
pkgdesc="Shell scripts made simple"
arch=('any')
url="https://github.com/tusharsadhwani/zxpy"
license=("MIT")
depends=("python")
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('c4fc8c59e2b6eb74ebec6c9ab6f0849b18ee1401f2634abc0bf3ba9568e37b5e599d80d06f47ff449c4bbe38266478b8cfa9ce1f300db5499fcf0de716aa801c')

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
