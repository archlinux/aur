# Maintainer: neXyon <https://aur.archlinux.org/account/nexyon>

_pkgname=openepub
pkgname=python-openepub
pkgver=0.0.9
pkgrel=1
pkgdesc="Python library to interact with EPUB files."
arch=('any')
url='https://github.com/sakolkar/openepub'
license=('Unlicense')
depends=(python)
makedepends=(python-hatchling)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2cf6e66613f5c65fd27b037c79c273eba03e8f3e3da06d99c4eab9f89630010f')

build() {
  cd "$_pkgname-$pkgver"
  python -m build -n
}

package() {
  cd "$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

