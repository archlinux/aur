# Maintainer: atomicfs <https://aur.archlinux.org/account/atomicfs>

pkgname=python-tika-client
pkgver=0.6.0
pkgrel=1
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
sha256sums=('aac1f999bc89a0b06acd3ba816fb0626e542af432926ad7c1f6ea80f27def1dd')

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
