# Maintainer: Xavier Francisco <echo moc.liamg@ocsicnarf.n.reivax | rev>

pkgname=pathaction
pkgver=1.1.4
pkgrel=1
pkgdesc="A file execution router that uses YAML rules to determine which commands to execute on files and directories"
arch=('any')
url="https://github.com/jamescherti/pathaction"
license=('GPL-3.0-only')
depends=('python' 'python-colorama' 'python-jinja' 'python-prompt_toolkit' 'python-schema' 'python-yaml')
optdepends=('python-setproctitle: set the process title to the command name')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-pytest' 'python-pytest-cov')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jamescherti/pathaction/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('97f2e30a86255a34cada7aef2af7c7ea9f9834eccaf464da7c4a63c2eb3d015b')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
