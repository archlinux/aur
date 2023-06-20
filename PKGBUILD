# Maintainer: amo <https://aur.archlinux.org/account/amo>

_pkgname=tika-client
pkgname=python-tika-client
pkgver=0.1.1
pkgrel=1
pkgdesc="A modern Python REST client for Apache Tika server"
arch=('any')
url="https://github.com/stumpylog/tika-client"
license=('GPL3')
# depends=('')
makedepends=('python-build' 'python-installer' 'python-hatchling')
source=("$pkgname-$pkgver.src.tar.gz::https://github.com/stumpylog/tika-client/archive/$pkgver.tar.gz")
sha256sums=('bad14e09ffd07b6c54182e15beed74a1e05e35a13f83008200859f20069ceb5b')

build() {
  cd "$_pkgname-$pkgver" || exit
  python -m build --wheel --no-isolation
}

package() {
  cd "$_pkgname-$pkgver" || exit
  python -m installer --destdir="$pkgdir" dist/*.whl
}