
pkgname=python2-hyperlink
pkgver=21.0.0
pkgrel=2
pkgdesc='A featureful, correct URL for Python'
arch=('any')
license=('BSD')
url='https://github.com/python-hyper/hyperlink'
depends=('python2-idna' 'python2-typing')
makedepends=('python2-setuptools')
checkdepends=('python2-pytest-runner')
source=("$pkgname-$pkgver.tar.gz::https://github.com/python-hyper/hyperlink/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('fa6c9da0e414319bf20be66dc5593b3fe2e8772c62d36adf2de32c277e49469ada952ca591f41fae8d2229812d79f1e6b7eaa23e63995c7f02ce10aa5569cd61')

build() {
  cd hyperlink-$pkgver
  python2 setup.py build
}

check() {
  cd hyperlink-$pkgver
  python2 setup.py pytest
}

package() {
  cd hyperlink-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
