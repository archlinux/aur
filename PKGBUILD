# Maintainer: envolution
# Contributor: Gabriel Magno <gabrielmagno1@gmail.com>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=python-langid
_pkgname=langid
pkgver=1.1.6
pkgrel=2
pkgdesc="A standalone Language Identification (LangID) tool"
arch=('any')
url="https://github.com/saffsd/langid.py"
license=('BSD')
depends=('python' 'python-numpy')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("https://pypi.python.org/packages/ea/4c/0fb7d900d3b0b9c8703be316fbddffecdab23c64e1b46c7a83561d78bd43/$_pkgname-$pkgver.tar.gz")
sha256sums=('044bcae1912dab85c33d8e98f2811b8f4ff1213e5e9a9e9510137b84da2cb293')

build() {
  cd "$_pkgname-$pkgver"
  python -m build --wheel --no-isolation
}
package() {
  cd "$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
