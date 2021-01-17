pkgname=python-joblib1
pkgver=1.0.0
pkgrel=1
pkgdesc="Set of tools to provide lightweight pipelining in Python version one"
arch=('any')
url="https://joblib.readthedocs.io/"
license=('BSD')
depends=('python')
optdepends=('python-numpy: for array manipulation'
            'python-lz4: for compressed serialization')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/joblib/joblib/archive/${pkgver}.tar.gz")
sha256sums=('a7cd4dfc41ceab2354beada00793c360c114d25082b7b41f36e749eb3462c73a')

build() {
  cd "$srcdir"/joblib-${pkgver}
  python setup.py build
}

package() {
  cd "$srcdir"/joblib-${pkgver}
  python setup.py install --skip-build --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
