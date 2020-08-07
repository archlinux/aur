# Maintainer: Bet4 <bet4it@gmail.com>

_pkgname=word_forms
pkgname=python-$_pkgname-git
pkgver=r29.4e1d76f
pkgrel=1
pkgdesc="Accurately generate all possible forms of an English word"
arch=('any')
url="https://github.com/gutfeeling/word_forms"
license=('MIT')
depends=('python-nltk' 'python-inflect' 'python-unipath')
makedepends=('python-setuptools')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname"
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
