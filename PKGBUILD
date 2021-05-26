# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=python-cyhunspell
pkgver=2.0.2
pkgrel=1
pkgdesc='Cython wrapper on Hunspell dictionary'
arch=('x86_64')
url='https://github.com/MSeal/cython_hunspell'
license=('MIT')
depends=('python-cacheman')
makedepends=('python-setuptools' 'python-wheel')
source=("https://github.com/MSeal/cython_hunspell/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('4af1222113ec7142eee3689ddf95e26c6c72ffa585426b99a1de243ec61bd87c')

build() {
  cd cython_hunspell-$pkgver
  python setup.py build
}

package() {
  cd cython_hunspell-$pkgver 
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
