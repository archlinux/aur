# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=python-ansi-git
_pkgname=ansi
pkgver=latest
pkgrel=1
pkgdesc="ANSI cursor movement and graphics"
arch=('any')
url="https://github.com/tehmaze/ansi"
license=('MIT')
depends=('python')
options=(!emptydirs)
source=("git+https://github.com/tehmaze/ansi.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname"
  python setup.py install --root="$pkgdir/" --optimize=1
}

