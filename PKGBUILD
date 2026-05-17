# Maintainer: Moonlit Tune <moonlit underscore tune at protonmail dot com>

pkgname=nomadnet
pkgver=1.1.0
pkgrel=1
pkgdesc="Off-grid, resilient mesh communication with strong encryption"
arch=('any')
depends=('python-lxmf' 'python-urwid')
makedepends=('python-setuptools')
url="https://github.com/markqvist/nomadnet"
license=('MIT')
source=($pkgname-$pkgver::$url/archive/refs/tags/$pkgver.tar.gz)
sha256sums=('7e88eeb56d4f17a6b7ebbe273647655eb8f4d67cb2758d5cacc05922d1cd01eb')

build() {
  cd "$srcdir/NomadNet-$pkgver"

  python setup.py build
}

package() {
  cd "$srcdir/NomadNet-$pkgver"

  install -Dm 644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  python setup.py install --root="$pkgdir" --optimize=1
}
