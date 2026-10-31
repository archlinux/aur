# Maintainer: Xavier Francisco <echo moc.liamg@ocsicnarf.n.reivax | rev>

pkgname=pathaction
pkgver=1.1.0
pkgrel=1
pkgdesc="A file execution router that uses YAML rules to determine which commands to execute on files and directories"
arch=('any')
url="https://github.com/jamescherti/pathaction"
license=('GPL-3.0-only')
depends=('python' 'python-colorama' 'python-jinja' 'python-schema' 'python-yaml')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-pytest' 'python-pytest-cov')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jamescherti/pathaction/archive/v$pkgver.tar.gz")
sha256sums=('3927818fcaed0750daffb0adcfd91be3c5215cdb54caa1e21fff2ec77ce3d3cc')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
