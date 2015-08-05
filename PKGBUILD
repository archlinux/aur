# Maintainer: Max Resch <resch.max@gmail.com>
pkgname=bat-svn
pkgver=r4171
pkgrel=1
pkgdesc="Binary Analysis Tool"
arch=('any')
url="http://www.binaryanalysis.org"
license=('APACHE')
depends=('python2')
makedepends=('svn')
optdepends=()
source=("bat-svn::svn+https://tjaldur.nl:8443/repos/gpltool/trunk")
md5sums=("SKIP")

pkgver() {
	cd "$pkgname"
	local ver="$(svnversion)"
	printf "r%s" "${ver//[[:alpha:]]}"
}

package() {
  cd "$srcdir/$pkgname/src"

  python2 setup.py install --root=${pkgdir}/ --optimize=1
}

# vim:set ts=2 sw=2 et:

