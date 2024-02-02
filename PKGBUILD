# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-green
pkgver=4.0.0
_commit=b4a8e40938a268dcde2152d0b4286ed292297adf
pkgrel=1
pkgdesc="Green is a clean, colorful, fast python test runner"
url="https://github.com/CleanCut/green"
license=('MIT')
arch=('any')
depends=('python-colorama' 'python-coverage' 'python-lxml' 'python-setuptools' 'python-unidecode')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-django' 'python-testtools')
source=("git+https://github.com/CleanCut/green.git#commit=$_commit")
sha512sums=('SKIP')

build() {
  cd green
  python -m build -nw
}

check() {
  cd green
  ./g 3 -r -vvvv green
}

package() {
  cd green
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
