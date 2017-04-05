# Maintainer: Max Resch <resch.max@gmail.com>
pkgname=bat-git
pkgver=36.0.r2.gefd8d7d1
pkgrel=1
pkgdesc="Binary Analysis Tool"
arch=('any')
url="http://www.binaryanalysis.org"
license=('Apache')
depends=('python2' 'python2-magic')
optdepends=('wxpython: GUI support')
makedepends=('git')
source=("${pkgname}::git+https://github.com/armijnhemel/binaryanalysis.git")
md5sums=('SKIP')
replaces=('bat-svn')

pkgver() {
	cd "$pkgname"
  git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$pkgname/src"

  python2 setup.py install --root=${pkgdir}/ --optimize=1
}

# vim:set ts=2 sw=2 et:

