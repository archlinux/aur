# Maintainer: Xavier Francisco <echo moc.liamg@ocsicnarf.n.reivax | rev>

pkgname=pathaction
pkgver=0.9.9
pkgrel=1
pkgdesc="A file execution router that uses YAML rules to determine which commands to execute on files and directories"
arch=('any')
url="https://github.com/jamescherti/pathaction"
license=('GPL-3.0-only')
depends=('python' 'python-colorama' 'python-jinja' 'python-schema' 'python-yaml')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-pytest' 'python-pytest-cov')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jamescherti/pathaction/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
