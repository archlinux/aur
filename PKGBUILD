# Maintainer: Bet4 <bet4it@gmail.com>

_pkgname=word_forms
pkgname=python-$_pkgname-git
pkgver=2.1.0.r1.g9f24160
pkgrel=1
pkgdesc="Accurately generate all possible forms of an English word"
arch=('any')
url="https://github.com/gutfeeling/word_forms"
license=('MIT')
depends=('python-nltk' 'python-inflect' 'python-levenshtein')
makedepends=('python-setuptools')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname"
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
