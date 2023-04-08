# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-green
pkgver=3.4.3
_commit=9483a2ecfcde055898d244b1f6800a428f2864a3
pkgrel=3
pkgdesc="Green is a clean, colorful, fast python test runner"
url="https://github.com/CleanCut/green"
license=('MIT')
arch=('any')
depends=('python-colorama' 'python-coverage' 'python-unidecode' 'python-lxml')
makedepends=('git' 'python-setuptools')
checkdepends=('python-django' 'python-testtools')
source=("git+https://github.com/CleanCut/green.git#commit=$_commit")
sha512sums=('SKIP')

build() {
  cd green
  python setup.py build
}

check() {
  cd green
  ./g 3 -r -vvvv green
}

package() {
  cd green
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
