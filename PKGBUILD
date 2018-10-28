# Maintainer: grufo <madmurphy333 AT gmail DOT com>
# Contributor: somepaulo <burafino AT gmail DOT com>

_extname='desktop-icons'
_uuid="org.gnome.${_extname}"
pkgname="gnome-shell-extension-${_extname}"
pkgver='r221.089d5fc'
pkgrel=1
pkgdesc='Add icons to the desktop'
arch=('x86_64' 'i686')
url="https://gitlab.gnome.org/World/ShellExtensions/desktop-icons"
license=('GPL3')
depends=('gnome-shell')
makedepends=('git')
options=('!strip')
source=("git+https://gitlab.gnome.org/World/ShellExtensions/${_extname}.git")
md5sums=('SKIP')

pkgver() {

	cd "${_extname}"
	printf "'r%s.%s'" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

package() {

	cd "${srcdir}/${_extname}"

	install -dm755 "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"
	cp -r "${srcdir}/${_extname}"/* "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"

}

