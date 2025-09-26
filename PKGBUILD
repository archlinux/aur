# Maintainer: neXyon <https://aur.archlinux.org/account/nexyon>

_pkgname=subtitle-parser
pkgname=python-subtitle-parser
pkgver=2.0.1
pkgrel=1
pkgdesc="This is a simple Python library for parsing subtitle files in SRT or WebVTT format."
arch=('any')
url='https://github.com/remram44/subtitle-parser'
license=('MIT')
depends=(python)
makedepends=(python-poetry)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('cbf47bcfb0e6efa184baf50543df55439057e3bd57963c228e3a410397c60a09')

build() {
  cd "$_pkgname-$pkgver"
  python -m build -n
}

package() {
  cd "$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

