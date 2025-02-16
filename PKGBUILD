# Maintainer: Moonlit Tune <moonlit underscore tune at protonmail dot com>

pkgname=nomadnet
pkgver=0.6.0
pkgrel=2
pkgdesc="Off-grid, resilient mesh communication with strong encryption"
arch=('any')
depends=('python-lxmf' 'python-urwid')
makedepends=('python-setuptools')
url="https://github.com/markqvist/nomadnet"
license=('MIT')
source=($pkgname-$pkgver::$url/archive/refs/tags/$pkgver.tar.gz)
sha256sums=('52eed5ac75a0244b21c0a5e186cbc275d6c00869ee027c8ff4c256014d669009')

build() {
  cd "$srcdir/NomadNet-$pkgver"

  python setup.py build
}

package() {
  cd "$srcdir/NomadNet-$pkgver"

  install -Dm 644 "README.md" "$pkgdir/usr/share/doc/nomadnet/README.md"
  install -Dm 644 "LICENSE" "$pkgdir/usr/share/licenses/nomadnet/LICENSE"

  python setup.py install --root="$pkgdir" --optimize=1
}
