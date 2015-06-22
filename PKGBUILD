# Maintainer: Kamil Krzyżanowski <kamnxt@kamnxt.com>
_pkgname=kerminal
pkgname=${_pkgname}-git
pkgver=20141202.5436795
pkgrel=1
pkgdesc="A terminal user interface for Kerbal Space Program via the Telemachus mod."
arch=('any')
url="https://github.com/SavinaRoja/Kerminal"
license=('GPL3')
depends=('python' 'python-docopt' 'python-autobahn' 'python-npyscreen2-git')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=(!emptydirs)
source=("${_pkgname}::git+https://github.com/SavinaRoja/Kerminal")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git log -1 --format='%cd.%h' --date=short | tr -d -
}

package() {
  cd ${srcdir}/${_pkgname}
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
