# Maintainer: Moonlit Tune <moonlit underscore tune at protonmail dot com>

pkgname=nomadnet
pkgver=0.5.3
pkgrel=1
pkgdesc="Off-grid, resilient mesh communication with strong encryption"
arch=('any')
depends=('python-lxmf' 'python-urwid')
makedepends=('python-setuptools')
url="https://github.com/markqvist/nomadnet"
license=('MIT')
source=($pkgname-$pkgver::$url/archive/refs/tags/$pkgver.tar.gz)
sha256sums=('c91606dc34a38a8229a8681a1d0abb0a363c6af3fa4f677c1152633e7deb73de')

build() {
  cd "$srcdir/NomadNet-$pkgver"

  python setup.py build
}

package() {
  cd "$srcdir/NomadNet-$pkgver"

  python setup.py install --root="$pkgdir" --optimize=1
}
