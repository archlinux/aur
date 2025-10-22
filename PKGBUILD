# Maintainer: Blair Bonnett <blair dot bonnett at gmail>

pkgname=python-plyfile
pkgdesc="Read and write ASCII and binary PLY files"
pkgver=1.1.3
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
  '840705c8eeb15d1c0951336bd5a21ad51da21330d873cef072ccf2cc78864cf9'
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
