# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=python-cacheman
pkgver=2.2.0
pkgrel=1
pkgdesc='Python interface for managing dependent caches'
arch=('any')
url='https://github.com/MSeal/py_cache_manager'
license=('BSD')
depends=('python-psutil' 'python')
makedepends=('python-setuptools')
source=("https://github.com/MSeal/py_cache_manager/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('e3cbd1d4cbf26d13d93b4be0c93312b340280e839f2ef2582a50c029def380d4')

build() {
  cd py_cache_manager-$pkgver
  python setup.py build
}

package() {
  cd py_cache_manager-$pkgver 
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
