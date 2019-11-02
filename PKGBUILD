# Maintainer: Rene Hahne <rehahne@gmail.com>

_pkgname=plasma-applet-places-widget
pkgname=${_pkgname}-git
pkgver=1.3.0
pkgrel=1
pkgdesc='Plasmoid Places Widget for Plasma desktop'
arch=('any')
url='https://github.com/HessiJames/plasma-applet-places-widget'
license=('GPL2')
depends=( 'plasma-framework' 'plasma-workspace' )
makedepends=( 'git' 'cmake' )
source=("${_pkgname}::git+https://github.com/HessiJames/plasma-applet-places-widget.git")
sha1sums=('SKIP')

pkgver() {
    cd ${_pkgname}
    _ver=${pkgver}".$(git rev-parse --short HEAD)"
    echo "${_ver}"
}

build() {
	cd ${_pkgname}
	mkdir build
	cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr ..
}

package() {
	cd ${_pkgname}/build
	make
    make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
