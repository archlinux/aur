# Maintainer: Sapphira Armageddos <shadowkyogre.public@gmail.com>
pkgname=fchat-pidgin-git
pkgver=0.5.0.r129.g3fc0e11
pkgrel=1
pkgdesc="Pidgin plugin for using FList's chat."
arch=('i686' 'x86_64')
url="https://github.com/fcwill/fchat-pidgin"
license=('GPL')
groups=()
depends=('pidgin' 'glib2' 'json-glib' 'nss')
makedepends=()
optdepends=()
provides=('fchat-pidgin')
conflicts=('fchat-pidgin')
replaces=()
backup=()
options=()
install=
source=("git+https://github.com/fcwill/fchat-pidgin.git")
noextract=()
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%%-git}"
	git describe --long --tags|sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/${pkgname%%-git}"
	make DISABLE_NSSFIX=1 || return 1
}

package() {
	cd "$srcdir/${pkgname%%-git}"
	make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2
