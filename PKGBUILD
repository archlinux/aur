# Maintainer: Leonid Lednev <leonidledn at gmail dot com>
_name="cadule"
pkgname="python-$_name"
pkgver=0.0.1
pkgrel=1
pkgdesc="Python library that provides decorators for converting regular modules into callable modules"
arch=('any')
url="https://pypi.org/project/cadule/"
license=('BSD-3-Clause')
depends=(
  'python>=3.8'
)
makedepends=(
  'python-build'
  'python-wheel'
  'python-installer'
  'python-setuptools'
)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('95aa7c467c67c19c392d091f0567a5a2d883cf35b69c64abfb668f4f77867b5e')

build() {
  cd "$_name-$pkgver"
  python -m build -wnx
}

package() {
  cd "$_name-$pkgver"
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm0644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: ts=2 sw=2 et:
