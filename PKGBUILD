pkgname=python-restructuredtext_lint
_pyname=restructuredtext-lint
pkgver=1.4.0
pkgrel=3
arch=(any)
pkgdesc="reStructuredText linter"
url='https://pypi.python.org/pypi/restructuredtext_lint'
license=('Public Domain')
depends=('python-docutils')
makedepends=(python-setuptools)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/twolfson/restructuredtext-lint/archive/${pkgver}.tar.gz")

build() {
  cd $_pyname-$pkgver
  python setup.py build
}

package() {
  cd $_pyname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 UNLICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

sha256sums=('c2482d1f47e52674016a3079bdcfe53ccf18d9aab80595cb2fafc64fb866c00f')
