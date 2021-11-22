pkgname=python2-dateutil
pkgver=2.8.2
pkgrel=1
pkgdesc="Provides powerful extensions to the standard datetime module"
arch=('any')
license=('BSD' 'Apache')
url="https://github.com/dateutil/dateutil"
depends=('python2' 'python2-six')
makedepends=('python2-setuptools-scm' 'python2-six' 'git')
source=(git+https://github.com/dateutil/dateutil.git#commit=6b035517571e63b6a63a493740c5506ec1e5da44?signed)
sha256sums=('SKIP')
validpgpkeys=('5DE3E0509C47EA3CF04A42D34AEE18F83AFDEB23') # Mario Corchero <mariocj89@gmail.com>

build() {
  cd "$srcdir"/dateutil
  python2 setup.py build
}

package() {
  cd "$srcdir"/dateutil
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}