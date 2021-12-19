# Maintainer: Martin Diehl <aur@martin-diehl.net>

pkgname=python-scooby
pkgver=0.5.10
pkgrel=1
pkgdesc='A Great Dane turned Python environment detective'
arch=('any')
url='https://github.com/banesullivan/scooby'
license=('MIT')
depends=('python')
makedepends=('python-setuptools' 'python-pip')
source=("https://github.com/banesullivan/scooby/archive/v${pkgver}.tar.gz")
sha256sums=('4ed1838b4e1469a4b1820141f38d4a1910a6ee59e066e67116596bd63fdd072e')

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
