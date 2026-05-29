# Maintainer: Blair Bonnett <blair dot bonnett at gmail>

pkgname=python-plyfile
pkgdesc="Read and write ASCII and binary PLY files"
pkgver=1.1.4
pkgrel=1
url='https://python-plyfile.readthedocs.io/'
arch=('any')
license=('GPL-3.0-or-later')

depends=(
  'python-numpy'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-pdm-backend'
)
checkdepends=(
  'python-pytest'
)

source=(
  "git+https://github.com/dranjan/python-plyfile.git#tag=v$pkgver"
)
sha256sums=(
  '8a7cdd7ca5a028294d210eec4fa6a149742f1cf71ba6148ab236c88b2ed1f718'
)

build() {
  cd python-plyfile
  python -m build --no-isolation --wheel
}

check() {
  cd python-plyfile
  python -m pytest
}

package() {
  cd python-plyfile
  python -m installer --destdir="$pkgdir" "dist/plyfile-$pkgver-"*.whl
}
