# Maintainer: Antony Lee <anntzer dot lee at gmail dot com>

_pyname=bibtex-pygments-lexer
_pyver=0.0.1
pkgname=python-${_pyname,,}
pkgver=$_pyver
pkgrel=1
pkgdesc='Pygments Lexer for BibTeX'
url="https://pypi.python.org/pypi/$_pyname/"
depends=('python-pygments')
makedepends=()
checkdepends=()
license=('BSD')
arch=('any')
source=("https://pypi.python.org/packages/source/${_pyname:0:1}/$_pyname/$_pyname-${_pyver:-$pkgver}.tar.gz"
        'LICENSE')
md5sums=('ed3cf11f45c10f09981a6f247d1a8307'
         'cec0aaa2b2cd70ae3ce4208ad93a0ec2')

build() {
  cd "$srcdir/$_pyname-${_pyver:-$pkgver}"
  python setup.py build
}

check() {
  cd "$srcdir/$_pyname-${_pyver:-$pkgver}"
  python setup.py test
}

package() {
  cd "$srcdir/$_pyname-${_pyver:-$pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
