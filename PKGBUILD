# Maintainer: Michal Krenek (Mikos) <m.krenek@gmail.com>
pkgname=python-reparser
_pkgname=reparser
pkgver=1.4.2
pkgrel=1
pkgdesc="Simple regex-based lexer/parser for inline markup"
arch=('any')
url="https://github.com/xmikos/reparser"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=(https://github.com/xmikos/reparser/archive/v$pkgver.tar.gz)
md5sums=('3111dfbd55a05bff29140a6e6563f876')

build() {
  cd "$srcdir/${_pkgname}-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/${_pkgname}-$pkgver"
  sed -i 's/^.*enum34.*$//' setup.py
  python setup.py install --root="$pkgdir"
}

# vim:set ts=2 sw=2 et:
