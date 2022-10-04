# Maintainer: Moonlit Tune <moonlit underscore tune at protonmail dot com>

pkgname=python-lxmf
_name='lxmf'
pkgver=0.1.9
pkgrel=1
pkgdesc="Lightweight Extensible Message Format for Reticulum"
arch=('any')
depends=('python-rns')
makedepends=('python-setuptools')
url="https://github.com/markqvist/lxmf"
license=('MIT')
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name//-/_}-$pkgver.tar.gz)
sha256sums=('fc00501d8f051fc66e9563d62531105fdbcd7f9153a5840e576bb58c544621ce')

build() {
  cd "$srcdir/$_name-$pkgver"

  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"

  python setup.py install --root="$pkgdir" --optimize=1
}
