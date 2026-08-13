# Maintainer: Blair Bonnett <blair dot bonnett at gmail>

pkgname=python-plyfile
pkgdesc="Read and write ASCII and binary PLY files"
pkgver=1.1.5
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
  'fd2cdcf52abc91d6a3512c0b28bab0ad791d2ddb897579c1e1be072c628b8153'
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
