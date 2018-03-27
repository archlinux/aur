# Maintainer: grufo <madmurphy333@gmail.com>

_extname='desktop-icons'
_uuid="org.gnome.${_extname}"
pkgname="gnome-shell-extension-${_extname}"
pkgver='r24.b9c25ca'
pkgrel=1
pkgdesc='Add icons to the desktop'
arch=('x86_64' 'i686')
url='https://gitlab.gnome.org/csoriano/${_uuid}'
license=('GPL3')
depends=('gnome-shell' 'gnome-shell-extensions')
makedepends=('git')
options=('!strip')
source=("git+https://gitlab.gnome.org/csoriano/${_uuid}.git")
md5sums=('SKIP')

pkgver() {

	cd "${_uuid}"
	printf "'r%s.%s'" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

package() {

	cd "${srcdir}/${_uuid}"

	install -dm755 "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"
	cp -r "${srcdir}/${_uuid}"/* "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"

}

