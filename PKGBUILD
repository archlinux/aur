# Maintainer: Jesus Franco <jesusfranco at gmail dot com>

_pkgname="findfileconflicts"
pkgname="${_pkgname}-git"
_gitname=findfileconflicts
pkgver=2018.04.04
pkgrel=1
pkgdesc="Helps to find file names which could have conflicts on Windows"
arch=('i686' 'x86_64')
url="https://github.com/artemanufrij/${_pkgname}"
license=('GPL3')

depends=('glib2' 'gtk3' 'hicolor-icon-theme' 'vala' 'granite' 'libpurple' 'gtksourceview3' 'libdbusmenu-gtk3')
optdepends=('elementary-icon-theme')
makedepends=('git' 'desktop-file-utils' 'hicolor-icon-theme' 'intltool' 'yelp-tools' 'gnome-common' 'gobject-introspection' 'meson' 'ninja')
options=('!libtool')
conflicts=('findfileconflicts' 'findfileconflicts-bzr')
provides=('findfileconflicts')
source=("git+https://github.com/artemanufrij/findfileconflicts.git")
md5sums=('SKIP')

build() {
	cd "${_pkgname}"
	meson build --prefix=/usr
	cd build
	ninja
}

package() {
	cd "${_gitname}/build"
	DESTDIR="${pkgdir}" ninja install
}
