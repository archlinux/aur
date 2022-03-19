# Maintainer: Fox Kiester <noct[at]posteo[dot]net>
_pkgname=zscroll
pkgname=zscroll-git
pkgver=2.0.1.r0.g788be96
pkgrel=1
pkgdesc="A text scroller for use with panels"
arch=('any')
url="https://github.com/noctuid/zscroll"
license=('GPL3')
depends=('python')
makedepends=('git')
provides=("${_pkgname}")
source=("git+https://github.com/noctuid/${_pkgname}")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$_pkgname"
  python setup.py install --root="$pkgdir/" --optimize=1
}
