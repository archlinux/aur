# Maintainer: Moonlit Tune <moonlit underscore tune at protonmail dot com>

pkgname=python-lxmf
_name='lxmf'
pkgver=0.5.4
pkgrel=1
pkgdesc="Lightweight Extensible Message Format for Reticulum"
arch=('any')
depends=('python-rns')
makedepends=('python-setuptools')
url="https://github.com/markqvist/lxmf"
license=('MIT')
source=($pkgname-$pkgver::$url/archive/refs/tags/$pkgver.tar.gz)
sha256sums=('7586a2493963f9b9419774ffb036e7c7ab3127237c19e2771ca31ad08b31a371')

build() {
  cd "$srcdir/LXMF-$pkgver"

  python setup.py build
}

package() {
  cd "$srcdir/LXMF-$pkgver"

  python setup.py install --root="$pkgdir" --optimize=1
}
