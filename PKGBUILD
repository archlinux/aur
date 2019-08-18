# Maintainer: Jean Lucas <jean@4ray.co>
# Contributor: Clint Valentine <valentine.clint@gmail.com>

pkgname=python-codecov
pkgver=2.0.15
pkgrel=2
pkgdesc='Report uploader for Codecov'
arch=(any)
url=https://codecov.io
license=(Apache)
depends=(python python-requests python-coverage)
makedepends=(python-setuptools)
source=(codecov-$pkgver.tar.gz::https://github.com/codecov/codecov-python/archive/v$pkgver.tar.gz)
sha512sums=('53cf2dc9926e2009a3918dfc7317d1e93f6ba9e25c6bb5bcc42c81fb15c07593f4fabd24883f081719432a029ab4f399126dea4cd8ff92d5e0f53b7155b1e522')

build() {
  cd codecov-python-$pkgver
  python setup.py build
}

package() {
  cd codecov-python-$pkgver
  python setup.py install --root="$pkgdir" -O1
  install -Dm 644 README.md -t "$pkgdir"/usr/share/doc/$pkgname
  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
