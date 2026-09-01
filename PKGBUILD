# Maintainer: Nils Werner <nils.werner@gmail.com>

pkgbase=python-confight
pkgname=(python-confight)
pkgver=2.0
pkgrel=1
pkgdesc='One simple way of parsing configs.'
arch=('any')
url="https://github.com/Avature/confight"
license=('MIT')
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
source=(
  "https://pypi.io/packages/source/c/confight/confight-$pkgver.tar.gz"
  "LICENSE.txt"
)
md5sums=(
  '3711e38a067880a045e08aec1d85c3db'
  'b62f1a403a498f2bc2240d7e85eceafe'
)

build() {
  cd "$srcdir"/confight-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir"/confight-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
