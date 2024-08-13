# Maintainer: atomicfs <https://aur.archlinux.org/account/atomicfs>

pkgname=python-gotenberg-client
_pkgname=gotenberg-client
pkgver=0.6.0
pkgrel=1
pkgdesc="A Python client for interfacing with the Gotenberg API"
arch=('any')
url="https://github.com/stumpylog/gotenberg-client"
license=('MPL-2.0')
depends=(
  'python'
)
makedepends=(
  'git'
  'python-build'
  'python-hatchling'
  'python-installer'
  'python-wheel'
)
checkdepends=(
  'python-pytest'
  'python-pytest-httpx'
)
source=("${pkgname}::git+${url}#tag=${pkgver}")
sha256sums=('61e60c4b418ce23745ed50f2718f02223fa4e5b3650c2ff6fbdc5ec450b62f45')

#check() {}
# Testing requires complex setup

build() {
  cd "${srcdir}/${pkgname}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${pkgname}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
