# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=python-cacheman
pkgver=2.1.0
pkgrel=1
pkgdesc='Python interface for managing dependent caches'
arch=('any')
url='https://github.com/MSeal/py_cache_manager'
license=('BSD')
depends=('python-future' 'python-psutil' 'python-six')
makedepends=('python-setuptools')
source=("https://github.com/MSeal/py_cache_manager/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('bc266ebbcfa61adf1766c42b80ed998c124a202c7f4b91160eaf07990881182f')

build() {
  cd py_cache_manager-$pkgver
  python setup.py build
}

package() {
  cd py_cache_manager-$pkgver 
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
