# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-case
pkgver=1.5.3
_commit=54341e0c8f2e41f0fcaa9d5dc325c33d4746168d
pkgrel=4
pkgdesc="Python unittest Utilities"
arch=('any')
license=('BSD')
url="https://github.com/celery/case"
depends=('python-nose')
makedepends=('git')
checkdepends=('python-coverage')
source=("git+https://github.com/celery/case.git#commit=$_commit")
sha512sums=('SKIP')

build() {
  cd "$srcdir"/case
  python setup.py build
}

check() {
  cd "$srcdir"/case
  nosetests3
}

package() {
  cd case
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
