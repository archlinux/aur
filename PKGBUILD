# Maintainer: amo <https://aur.archlinux.org/account/amo>

_pkgname=gotenberg-client
pkgname=python-gotenberg-client
pkgver=0.3.0
pkgrel=2
pkgdesc="A Python client for interfacing with the Gotenberg API"
arch=('any')
url="https://github.com/stumpylog/gotenberg-client"
license=('MPL2')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
source=("$pkgname-$pkgver.src.tar.gz::https://github.com/stumpylog/gotenberg-client/archive/$pkgver.tar.gz")
sha256sums=('0e1dcc8dbec53fea845b9de0a3938e337d5db29c132583f033edc2815b463796')

build() {
  cd "$_pkgname-$pkgver" || exit
  python -m build --wheel --no-isolation
}

package() {
  cd "$_pkgname-$pkgver" || exit
  python -m installer --destdir="$pkgdir" dist/*.whl
}