# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Achmad Fathoni<fathoni.id(at)gmail.com>

pkgname=python-nspektr
pkgver=0.5.0
_commit=82b973da8e4fb9e8095347ea86ef17adbd7d9159
pkgrel=2
pkgdesc="A distribution package dependency inspector"
arch=('any')
url="https://github.com/jaraco/nspektr"
license=('MIT')
depends=('python-jaraco.context' 'python-jaraco.functools' 'python-more-itertools'
         'python-packaging')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools-scm')
checkdepends=('python-pytest-enabler' 'python-pytest-mypy')
source=("git+https://github.com/jaraco/nspektr.git#commit=$_commit")
sha256sums=('SKIP')

build() {
  cd nspektr
  python -m build -wn
}

check() {
  cd nspektr
  python -m pytest
}

package() {
  cd nspektr
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
