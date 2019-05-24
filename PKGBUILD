# Maintainer: Igor R. Dejanović <igor dot dejanovic at gmail.com>

pkgname=python2-arpeggio
_srcname=Arpeggio
pkgver=1.9.0
pkgrel=2
pkgdesc="Recursive descent parser with memoization based on PEG grammars (aka Packrat parser)."
arch=('any')
url="https://github.com/textX/Arpeggio/"
license=('MIT')
depends=('python2')
makedepends=('python2-setuptools')
checkdepends=('python2-pytest-runner')
source=($pkgname-$pkgver.tar.gz::https://github.com/textX/$_srcname/archive/v$pkgver.tar.gz)
md5sums=('dd06e3765aca66535947c8c4da088673')

build() {
  cd $_srcname-$pkgver
  python2 setup.py build
}

check() {
  cd $_srcname-$pkgver
  python2 setup.py pytest --addopts tests/unit
}

package() {
  cd $_srcname-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
