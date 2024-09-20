# Maintainer: Moonlit Tune <moonlit underscore tune at protonmail dot com>

pkgname=python-lxmf
_name='lxmf'
pkgver=0.5.3
pkgrel=1
pkgdesc="Lightweight Extensible Message Format for Reticulum"
arch=('any')
depends=('python-rns')
makedepends=('python-setuptools')
url="https://github.com/markqvist/lxmf"
license=('MIT')
source=($pkgname-$pkgver::$url/archive/refs/tags/$pkgver.tar.gz)
sha256sums=('a96416ee6614f889ddfdef710d9b14e1dd32f9003347ab9835c73a78d39748b9')

build() {
  cd "$srcdir/LXMF-$pkgver"

  python setup.py build
}

package() {
  cd "$srcdir/LXMF-$pkgver"

  python setup.py install --root="$pkgdir" --optimize=1
}
