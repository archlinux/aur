# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-green
pkgver=3.5.0
_commit=c3ebfb5e7e9aa01654a9e5b73c9f183c4fa50de3
pkgrel=1
pkgdesc="Green is a clean, colorful, fast python test runner"
url="https://github.com/CleanCut/green"
license=('MIT')
arch=('any')
depends=('python-colorama' 'python-coverage' 'python-unidecode' 'python-lxml')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
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
