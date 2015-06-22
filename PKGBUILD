# Maintainer: Kamil Krzyżanowski <kamnxt@kamnxt.com>
_pkgname=python-npyscreen2
pkgname=${_pkgname}-git
pkgver=20141124.75ecd73
pkgrel=1
pkgdesc="A fork of npyscreen with changed core components"
arch=('any')
url="https://github.com/SavinaRoja/npyscreen2"
license=('GPL3')
depends=('python')
makedepends=('git')
provides=("${_pkgname}")
options=(!emptydirs)
source=("${_pkgname}::git+https://github.com/SavinaRoja/npyscreen2")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git log -1 --format='%cd.%h' --date=short | tr -d -
}

package() {
  cd "${srcdir}/${_pkgname}"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:    
