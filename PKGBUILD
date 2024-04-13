# Maintainer: amo <https://aur.archlinux.org/account/amo>

_pkgname=gotenberg-client
pkgname=python-gotenberg-client
pkgver=0.5.0
pkgrel=1
pkgdesc="A Python client for interfacing with the Gotenberg API"
arch=('any')
url="https://github.com/stumpylog/gotenberg-client"
license=('MPL2')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
source=("$pkgname-$pkgver.src.tar.gz::https://github.com/stumpylog/gotenberg-client/archive/$pkgver.tar.gz")
sha256sums=('a93b5f17e5aa7a6c7d8ad72b0a4b16d17c2eb11bc7ce67ce390c0e65d535e14b')

build() {
  cd "$_pkgname-$pkgver" || exit
  python -m build --wheel --no-isolation
}

package() {
  cd "$_pkgname-$pkgver" || exit
  python -m installer --destdir="$pkgdir" dist/*.whl
}
