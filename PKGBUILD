# Maintainer: Moses Miller <Majora320 at gmail dot com>
pkgname=jelly-git
pkgver=r319.70c9fd9
pkgrel=1
pkgdesc="An esoratic programming language"
arch=('any')
url="http://github.com/DennisMitchell/jelly"
license=('MIT')
depends=('python3' 'python-sympy' 'python-numpy')
makedepends=('git' 'python3')
source=("$pkgname::git+http://github.com/DennisMitchell/jelly")
md5sums=('SKIP')

_python3ver="$(python3 --version | sed -E 's/Python ([[:digit:]].[[:digit:]]).[[:digit:]]/\1/')"

package() {
    cd "$pkgname"

    python3 setup.py install --prefix "$pkgdir/usr"
}

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
