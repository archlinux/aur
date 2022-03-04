# Maintainer: Martin Diehl <aur@martin-diehl.net>

pkgname=python-scooby
pkgver=0.5.12
pkgrel=1
pkgdesc='A Great Dane turned Python environment detective'
arch=('any')
url='https://github.com/banesullivan/scooby'
license=('MIT')
depends=('python')
makedepends=('python-setuptools' 'python-pip')
source=("https://github.com/banesullivan/scooby/archive/v${pkgver}.tar.gz")
sha256sums=('a3011c68cfae82d586f6a84b70aafcb4189f4362bb6239b026ecff05ffe7eaa7')

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
