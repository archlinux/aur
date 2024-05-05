# Maintainer: atomicfs <https://aur.archlinux.org/account/atomicfs>

pkgname=python-tika-client
pkgver=0.5.0
pkgrel=2
pkgdesc="A modern Python REST client for Apache Tika server"
arch=('any')
url="https://github.com/stumpylog/tika-client"
license=('MPL-2.0')
depends=(
  'python'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-hatchling'
  'python-editables'
  'python-pathspec'
)
checkdepends=(
  'python-pytest'
)
source=("${pkgname}::git+${url}#tag=${pkgver}")
sha256sums=('SKIP')

#check() {}
# Woudl require complex setup

build() {
  cd "${srcdir}/${pkgname}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${pkgname}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
