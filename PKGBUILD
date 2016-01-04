# Maintainer:  Tommaso Sardelli <lacapannadelloziotom AT gmail DOT com>
# Contributor: Philipp Joram <phijor AT t-online DOT de>

pkgname='python2-axolotl-curve25519-git'
_pkgname='python-axolotl-curve25519'
pkgver=r14.e4a9c4d
pkgrel=1
pkgdesc="Python wrapper for curve25519 library"
url="https://github.com/tgalal/${_pkgname}"
arch=('i686' 'x86_64')
license=('GPL')
depends=('python2')
makedepends=('python2-setuptools')
conflicts=('python2-axolotl-curve25519')
provides=('python2-axolotl-curve25519')
source=('git://github.com/tgalal/python-axolotl-curve25519')
sha512sums=('SKIP')


pkgver() {
  cd "$srcdir/$_pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd "$srcdir/$_pkgname"
  python2 setup.py install --root="$pkgdir/"
}
