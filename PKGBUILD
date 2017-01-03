# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=shlomif-cmake-modules-hg
pkgver=r10.2ef56bcbda95
pkgrel=2
pkgdesc='cmake modules required to build projects from Shlomi Fish'
arch=('any')
url='https://bitbucket.org/shlomif/shlomif-cmake-modules/'
license=('MIT')
depends=('cmake')
makedepends=('mercurial' 'cmake')
provides=('shlomif-cmake-modules')
conflicts=('shlomif-cmake-modules')
source=('hg+https://bitbucket.org/shlomif/shlomif-cmake-modules')
sha256sums=('SKIP')
_name='shlomif-cmake-modules'

pkgver() {
  cd "${_name}"
	printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

package() {
  cd "${srcdir}/${_name}"

	install -dm755 "${pkgdir}/usr/share/cmake/Modules"
	install -m664 shlomif-cmake-modules/Shlomif_Common.cmake "${pkgdir}/usr/share/cmake/Modules/"
}

# vim: set ts=2 sw=2 ft=sh noet:
