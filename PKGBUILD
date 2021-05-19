# Maintainer: grufo <madmurphy333 AT gmail DOT com>

_appname='nextgen'
pkgname="${_appname}-git"
pkgver='r12.820419d'
pkgrel=1
pkgdesc='An interactive Bash script that lets you easily set up a new extension project for GNOME Files (formerly Nautilus)'
arch=('any')
url="https://github.com/madmurphy/${_appname}"
license=('GPL')
depends=('bash' 'libnautilus-extension')
provides=("${_appname}")
conflicts=("${_appname}")
source=("git+https://github.com/madmurphy/${_appname}.git")
sha256sums=('SKIP')

pkgver() {

	cd "${_appname}"
	printf "'r%s.%s'" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

prepare() {

	cd "${srcdir}/${_appname}"
	autoreconf -i

}

build() {

	cd "${srcdir}/${_appname}"
	./configure --prefix=/usr

}

package() {

	cd "${srcdir}/${_appname}"
	make DESTDIR="${pkgdir}" install

}

