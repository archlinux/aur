#Maintainer: KarlWithK < jocelinc60 at outlook d@t com >
pkgname=python-urwid-ueberzogen
_pkgname=urwid-ueberzogen
pkgver=0.0.4
pkgrel=1
pkgdesc='Some widgets which extend urwid with the possibility to use ueberzug.'
arch=('any')
url="https://github.com/seebye/urwid-ueberzogen"
license=('GPL3')
depends=('python-ueberzug' 'python-urwid')
makedepends=('python-setuptools')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/seebye/${_pkgname}/archive/refs/tags/${pkgver}.tar.gz")
md5sums=('85336dc1398186cc9e24222c8a79714b')

build() {
  cd "$srcdir/$_pkgname-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-${pkgver}"
  python setup.py install --skip-build --optimize=1 --root="$pkgdir/"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
