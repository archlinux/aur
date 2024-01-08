# Maintainer: amo <https://aur.archlinux.org/account/amo>

_pkgname=gotenberg-client
pkgname=python-gotenberg-client
pkgver=0.4.1
pkgrel=1
pkgdesc="A Python client for interfacing with the Gotenberg API"
arch=('any')
url="https://github.com/stumpylog/gotenberg-client"
license=('MPL2')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
source=("$pkgname-$pkgver.src.tar.gz::https://github.com/stumpylog/gotenberg-client/archive/$pkgver.tar.gz")
sha256sums=('d18637f5d82fb9e6fb55ea39d2cb1cbe5c997d15fdf2951c995957cf4bf4ca6b')

build() {
  cd "$_pkgname-$pkgver" || exit
  python -m build --wheel --no-isolation
}

package() {
  cd "$_pkgname-$pkgver" || exit
  python -m installer --destdir="$pkgdir" dist/*.whl
}