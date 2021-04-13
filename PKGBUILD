# Maintainer: Martin Diehl <aur@martin-diehl.net>

pkgname=python-scooby
pkgver=0.5.7
pkgrel=1
pkgdesc='A Great Dane turned Python environment detective'
arch=('any')
url='https://github.com/banesullivan/scooby'
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/banesullivan/scooby/archive/v${pkgver}.tar.gz")
sha256sums=('c7fc23d96ef1fb567e7eea6b406cde021fbc8602083c48bffc85abc5e402b7b3')

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
