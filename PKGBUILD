# Maintainer: Xavier Francisco <echo moc.liamg@ocsicnarf.n.reivax | rev>

pkgname=pathaction
pkgver=1.0.1
pkgrel=1
pkgdesc="A file execution router that uses YAML rules to determine which commands to execute on files and directories"
arch=('any')
url="https://github.com/jamescherti/pathaction"
license=('GPL-3.0-only')
depends=('python' 'python-colorama' 'python-jinja' 'python-schema' 'python-yaml')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-pytest' 'python-pytest-cov')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jamescherti/pathaction/archive/v$pkgver.tar.gz")
sha256sums=('9f8fe261ff316b4458d173c35a5c6228f2d57c4a2d84d9d3edf0884e567bd4ca')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
