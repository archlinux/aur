# Maintainer: tembleking <tembleking at gmail dot com>
# Maintainer: Nathan Owens <ndowens @ artixlinux.org>

pkgname=python-polyline
pkgver=1.4.0
pkgrel=1
pkgdesc="Python implementation of Google's Encoded Polyline Algorithm Format."
arch=("any")
url="https://github.com/hicsail/polyline"
license=('MIT')
makedepends=("git" "python-setuptools")
depends=("python")
source=("git+https://github.com/hicsail/polyline#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  cd "$srcdir/polyline"
  python setup.py build
}

package() {
  cd "$srcdir/polyline"
  python setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
