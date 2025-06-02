# Maintainer: Blair Bonnett <blair dot bonnett at gmail>

pkgname=python-plyfile
pkgdesc="Read and write ASCII and binary PLY files"
pkgver=1.1.2
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
  '86e213abcd87c1d39d7ff53299ba5c4790e2f93bbe0e2886d0bd22d3e7e6e67d'
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
