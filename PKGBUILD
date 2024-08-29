# Maintainer: Moonlit Tune <moonlit underscore tune at protonmail dot com>

pkgname=python-lxmf
_name='lxmf'
pkgver=0.4.5
pkgrel=1
pkgdesc="Lightweight Extensible Message Format for Reticulum"
arch=('any')
depends=('python-rns')
makedepends=('python-setuptools')
url="https://github.com/markqvist/lxmf"
license=('MIT')
source=($pkgname-$pkgver::$url/archive/refs/tags/$pkgver.tar.gz)
sha256sums=('c0cdb8a2c881162e661a74bcd71f1c94dfee5a3c92300c8ddaa86b924a5d49f7')

build() {
  cd "$srcdir/LXMF-$pkgver"

  python setup.py build
}

package() {
  cd "$srcdir/LXMF-$pkgver"

  python setup.py install --root="$pkgdir" --optimize=1
}
