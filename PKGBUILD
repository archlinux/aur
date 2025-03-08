# Maintainer: Diego Miguel Lozano <hello@diegomiguel.me>

pkgname=python-casefy
_pkgname=${pkgname#python-}
pkgver=1.1.0
pkgrel=1
pkgdesc='Utilities to convert the case of strings'
arch=('any')
url='https://pypi.org/project/casefy'
license=('MIT')
makedepends=('python-build' 'python-installer')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/48/24/9c732e8e3585a1dc621c9c1349e55e87070c95d3c2d57bd8c5083ec8d731/casefy-1.1.0.tar.gz")
sha256sums=('849d6e0f80506fac70ab8e18999a4ca1eb7d8f70941682383d64aa22a7497f8f')

_archive="$_pkgname-$pkgver"

build() {
  cd "$_archive"
  python -m build --wheel
}

package() {
  cd "$_archive"
  python -m installer --destdir="$pkgdir/" dist/*.whl
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

