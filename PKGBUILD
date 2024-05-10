# Maintainer: atomicfs <https://aur.archlinux.org/account/atomicfs>

pkgname=python-blkinfo
pkgver=0.2.0
pkgrel=4
pkgdesc="A python library to list information about all available or the specified block devices"
arch=('any')
url="https://github.com/grinrag/blkinfo"
license=('GPL-3.0-only')
depends=(
  'python'
  'util-linux'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-wheel'
)
source=("${pkgname}::git+${url}#tag=${pkgver}")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${pkgname}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
