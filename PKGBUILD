# Maintainer: Berrit Birkner <aur at bbirkner.de>
pkgname=python-apkinspector
pkgver=1.2.1
pkgrel=1
pkgdesc="A tool to decode and manipulate android apks"
arch=('any')
url="https://github.com/erev0s/apkInspector"
license=('Apache-2.0')
makedepends=(
  'python-build'
  'python-wheel'
  'python-installer'
  'python-poetry-core'
)
depends=(
  'python'
)
source=("$pkgname"-"$pkgver"::'https://github.com/erev0s/apkInspector/archive/refs/tags/v1.2.1.tar.gz')
sha256sums=('5b3ed5b7ee268c39577b541741e88d142073e584f954f2b32ef433ecc3fd67be')

build () {
  cd "$srcdir/apkInspector-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/apkInspector-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
