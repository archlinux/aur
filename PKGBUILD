# Maintainer: amo <https://aur.archlinux.org/account/amo>

_pkgname=tika-client
pkgname=python-tika-client
pkgver=0.5.0
pkgrel=1
pkgdesc="A modern Python REST client for Apache Tika server"
arch=('any')
url="https://github.com/stumpylog/tika-client"
license=('MPL2')
# depends=('')
makedepends=('python-build' 'python-installer' 'python-hatchling' 'python-editables' 'python-pathspec')
source=("$pkgname-$pkgver.src.tar.gz::https://github.com/stumpylog/tika-client/archive/$pkgver.tar.gz")
sha256sums=('e329b8433802058745bdda3ca40ec01dd703275cbbba9b28f252e4a094b1f440')

build() {
  cd "$_pkgname-$pkgver" || exit
  python -m build --wheel --no-isolation
}

package() {
  cd "$_pkgname-$pkgver" || exit
  python -m installer --destdir="$pkgdir" dist/*.whl
}