pkgname=mitogen
pkgver=0.2.5
pkgrel=1
pkgdesc="Distributed self-replicating programs in Python"
license=("BSD")
url="https://mitogen.readthedocs.io/"
depends=('python')
makedepends=('python-setuptools')
optdepends=('ansible: for using the ansible strategy plugin')
source=("https://github.com/dw/mitogen/archive/v${pkgver}.tar.gz")
arch=('any')

# https://github.com/dw/mitogen/commit/458a4faa979cac0e7d4a5431ec1f84da64a5787f
prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  touch ansible_mitogen/compat/__init__.py
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

md5sums=('6f3dcf26b450ff784e79a79bc0695797')
sha1sums=('76720cf8453adf1f6925e9088df2603963c79b69')
sha256sums=('d24b4db3884c37068001ebe5989ae2fbc66938ab461acd9f2f4c0ae1c5919015')
sha384sums=('673d43021221cbd9cc3c883a36f9dbf85e0d5850ff43a0c0caddedddb4693789c7b5bb63d35e9cc245d10bb20503d0a4')
sha512sums=('c68f3042fb14d87c9d2aa3a8c54e9ec717469756c4006d642f5f9c3f39c8598ad5aeac80ab1bcd6961289ddec0a4bb4380aab3a0495a65c94a96ad2f376670db')
