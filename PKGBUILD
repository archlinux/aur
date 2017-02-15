# Maintainer: Daniel Nagy <danielnagy at gmx de>

pkgname=python2-coffin
pkgver=2.0.1
pkgrel=1
pkgdesc="Jinja2 adapter for Django"
arch=(any)
url="https://pypi.python.org/pypi/Coffin"
license=('BSD')
depends=('python2')
makedepends=('python2-setuptools')
source=("coffin-$pkgver.tar.gz::https://pypi.python.org/packages/source/C/Coffin/Coffin-$pkgver.tar.gz")
sha256sums=('b1cfb44b1ef7daabc7c607a937f85e4b89b63bd9536ee3b817461747a476a65c')

build() {
  cd Coffin-$pkgver
  python2 setup.py build
}

package() {
  cd Coffin-$pkgver
  python2 setup.py install --prefix=/usr --root="$pkgdir" --skip-build
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
