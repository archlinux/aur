# Maintainer: robertfoster

pkgname=blindelephant-svn
pkgver=7
pkgrel=1
pkgdesc="The BlindElephant Web Application Fingerprinter attempts to discover the version of a (known) web application by comparing static files at known locations "
url="http://blindelephant.sourceforge.net/"
arch=('x86_64')
makedepends=('subversion')
depends=('python2')
license=(LGPL)
provides=("${pkgname%-svn}")
conflicts=("${pkgname%-svn}")
source=("blindelephant::svn+https://svn.code.sf.net/p/blindelephant/code/trunk")

package() {
  cd blindelephant/src
  python2 setup.py install --root="$pkgdir"

}

pkgver() {
  cd blindelephant
  svnversion | tr -d [A-z]
}

sha256sums=('SKIP')
