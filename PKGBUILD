# Maintainer: Moonlit Tune <moonlit underscore tune at protonmail dot com>

pkgname=nomadnet
_name=${pkgname#python-}
pkgver=1.5.1
pkgrel=1
pkgdesc="Off-grid, resilient mesh communication with strong encryption"
arch=('any')
depends=('python-lxmf' 'python-urwid')
makedepends=('python-setuptools')
url="https://reticulum.network/"
license=('MIT')
source=($pkgname-$pkgver::https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz)
sha256sums=('fc340de0f14b313ebfe81f07ac1c836a84077766308b73f2df358134b71deed6')

build() {
  cd "$srcdir/$_name-$pkgver"

  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"

  install -Dm 644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"

  python setup.py install --root="$pkgdir" --optimize=1
}
