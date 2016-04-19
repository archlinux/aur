# Maintainer: Luca Weiss <WEI16416@spengergasse.at>
# Contributor: Tommaso Sardelli <lacapannadelloziotom AT gmail DOT com>
# Contributor: Philipp Joram <phijor AT t-online DOT de>

pkgname=python-axolotl-curve25519-git
_pkgname=python-axolotl-curve25519
pkgver=r14.e4a9c4d
pkgrel=1
pkgdesc="Python wrapper for curve25519 library"
url="https://github.com/tgalal/${_pkgname}"
arch=('any')
license=('GPL')
depends=('python')
makedepends=('python-setuptools')
conflicts=('python-axolotl-curve25519')
provides=('python-axolotl-curve25519')
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
  python setup.py install --root="$pkgdir/" --optimize=1
}
