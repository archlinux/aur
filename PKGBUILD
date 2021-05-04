# Maintainer: Thor77 <thor77 at thor77 dot org>
# Contributor: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Tommaso Sardelli <lacapannadelloziotom AT gmail DOT com>
# Contributor: Philipp Joram <phijor AT t-online DOT de>

pkgname='python-axolotl-curve25519-git'
_pkgname='python-axolotl-curve25519'
pkgver=0.4.1.2.r0.293f9cd
pkgrel=2
pkgdesc="Python wrapper for curve25519 library"
url="https://github.com/tgalal/${_pkgname}"
arch=('i686' 'x86_64')
license=('GPL')
depends=('python')
makedepends=('python-setuptools' 'git')
conflicts=('python-axolotl-curve25519')
provides=('python-axolotl-curve25519')
source=('git+https://github.com/tgalal/python-axolotl-curve25519')
sha512sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

package() {
  cd "$_pkgname"
  python setup.py install --root="$pkgdir/"
}
