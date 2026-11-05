# Maintainer: Xavier Francisco <echo moc.liamg@ocsicnarf.n.reivax | rev>

pkgname=pathaction
pkgver=1.1.3
pkgrel=1
pkgdesc="A file execution router that uses YAML rules to determine which commands to execute on files and directories"
arch=('any')
url="https://github.com/jamescherti/pathaction"
license=('GPL-3.0-only')
depends=('python' 'python-colorama' 'python-jinja' 'python-schema' 'python-yaml')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-pytest' 'python-pytest-cov')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jamescherti/pathaction/archive/v$pkgver.tar.gz")
sha256sums=('0ee1540ca13ba5c05f2fbeb4e16d25e8c00c73a6ec13361be87b798fb1e4cd36')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
