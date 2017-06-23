# Maintainer: ValHue <vhuelamo at gmail dot com>
# https://github.com/ValHue/AUR-PKGBUILDs
#
_pkgname="cover-thumbnailer"
pkgname="${_pkgname}-git"
pkgver=760a344
pkgrel=1
pkgdesc="Generates thumbnails for Nautilus folders (music album covers,...)."
arch=('i686' 'x86_64')
url="https://github.com/flozz/cover-thumbnailer"
license=('GPL3')
depends=('python2-pillow' 'python2-gconf')
makedepends=('gettext')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/flozz/${_pkgname}")
sha256sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  git describe --always | sed 's|-|.|g' | sed 's|_|.|g' | cut -d'.' -f2-
}

package() {
	cd "${srcdir}/${_pkgname}"
	./install.sh -p ${pkgdir}
}

# vim:set ts=4 sw=2 ft=sh et:
