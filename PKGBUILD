# Maintainer: Moonlit Tune <moonlit underscore tune at protonmail dot com>

pkgname=python-lxmf
_name='lxmf'
pkgver=0.4.3
pkgrel=1
pkgdesc="Lightweight Extensible Message Format for Reticulum"
arch=('any')
depends=('python-rns')
makedepends=('python-setuptools')
url="https://github.com/markqvist/lxmf"
license=('MIT')
source=($pkgname-$pkgver::$url/archive/refs/tags/$pkgver.tar.gz)
sha256sums=('2d5e40ebd9c24546aea6186c4e0c742ab846e12ddd7d311dd72d3e8ea3300152')

build() {
  cd "$srcdir/LXMF-$pkgver"

  python setup.py build
}

package() {
  cd "$srcdir/LXMF-$pkgver"

  python setup.py install --root="$pkgdir" --optimize=1
}
