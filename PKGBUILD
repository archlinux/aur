# Maintainer: Nahuel Gomez Castro <nahual_gomca@outlook.com.ar>

pkgname='app-icon-preview'
pkgver='1.0.1'
pkgrel='1'
pkgdesc='Tool for designing applications icons.'
changelog='CHANGELOG'
arch=('x86_64')
url="https://gitlab.gnome.org/World/design/${pkgname}"
license=('GPL3')
depends=('librsvg' 'libdazzle' 'libhandy')
makedepends=('vala' 'meson' 'git')
source=("git+${url}.git#tag=${pkgver}")
sha256sums=('SKIP')

pkgver () {
	cd ${pkgname}
	git describe --tags | sed 's/-/.r/; s/-/./'
}

build () {
	arch-meson ${pkgname} build
	ninja -C build
}

package () {
	DESTDIR="${pkgdir}" ninja -C build install
}
