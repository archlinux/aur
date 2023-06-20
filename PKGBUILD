# Maintainer: amo <https://aur.archlinux.org/account/amo>

_pkgname=tika-client
pkgname=python-tika-client
pkgver=0.0.3
pkgrel=1
pkgdesc="A modern Python REST client for Apache Tika server"
arch=('any')
url="https://github.com/stumpylog/tika-client"
license=('GPL3')
# depends=('')
makedepends=('python-build' 'python-installer' 'python-hatchling')
source=("$pkgname-$pkgver.src.tar.gz::https://github.com/stumpylog/tika-client/archive/$pkgver.tar.gz")
sha256sums=('5a831849655d9c22f736f20c60d1dc72cee8abf8456f4279f68a4a6a3539fcb7')

build() {
  cd "$_pkgname-$pkgver" || exit
  python -m build --wheel --no-isolation
}

package() {
  cd "$_pkgname-$pkgver" || exit

  python -m installer --destdir="$pkgdir" dist/*.whl
}