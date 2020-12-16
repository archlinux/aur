# Maintainer: Martin Diehl <aur@martin-diehl.net>

pkgname=python-scooby
pkgver=0.5.6
pkgrel=1
pkgdesc='A Great Dane turned Python environment detective'
arch=('any')
url='https://github.com/banesullivan/scooby'
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/banesullivan/scooby/archive/v${pkgver}.tar.gz")
sha256sums=('f8e613825b7a02e7e19f72d3285ff9927545ff9b733c9d8d756cd66740396401')

build() {
  cd "$srcdir"/scooby-${pkgver}
  python setup.py build_ext --inplace
  python setup.py build
}

package() {
  cd "$srcdir"/scooby-${pkgver}
  python setup.py install --skip-build --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
