# Maintainer: Diego Miguel Lozano <hello@diegomiguel.me>

pkgname=python-casefy
_pkgname=${pkgname#python-}
pkgver=1.0.0
pkgrel=1
pkgdesc='Utilities to convert the case of strings'
arch=('any')
url='https://pypi.org/project/casefy'
license=('MIT')
makedepends=('python-build' 'python-installer')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/bf/50/f5991618899c42d0c6339bd83fed5f694f56b204dfb3f2a052f0d586d4c5/casefy-1.0.0.tar.gz")
sha256sums=('bc99428475c2089c5f6a21297b4cfe4e83dff132cf3bb06655ddcb90632af1ed')


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

