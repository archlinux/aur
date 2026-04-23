# Maintainer: Moonlit Tune <moonlit underscore tune at protonmail dot com>

pkgname=nomadnet
pkgver=0.9.11
pkgrel=1
pkgdesc="Off-grid, resilient mesh communication with strong encryption"
arch=('any')
depends=('python-lxmf' 'python-urwid')
makedepends=('python-setuptools')
url="https://github.com/markqvist/nomadnet"
license=('MIT')
source=($pkgname-$pkgver::$url/archive/refs/tags/$pkgver.tar.gz)
sha256sums=('86fe3e822e5a1cf7401f4965de0ceda740b2467fd4f2d2f909f90c7db25038f4')

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
