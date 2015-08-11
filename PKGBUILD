# Maintainer: Gary DeLaney <gld1982ltd@gmail.com>

_gitroot="git://github.com/semplice/libconfig-vapi.git"
_gitbranch=master
_gitname=libconfig-vapi

pkgname="$_gitname-git"
pkgver=0
pkgrel=1
pkgdesc="X11 Screen Saver extension library (vala bindings)."
arch=(i686 x86_64)
url="https://github.com/semplice/libconfig-vapi"
license=('LGPL')
groups=()
depends=('vala')
makedepends=()
provides=("${pkgname%}")
conflicts=("${pkgname%}" '${pkgname%-git}')
replaces=()
backup=()
options=()
install=
source=("${_gitname}::${_gitroot}#branch=${_gitbranch}")
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --abbrev=0 | sed 's/[A-Za-z]*//g;s/[!@#\$%^&*()/]//g;s/-/./g')"
}


package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dm644 libconfig.vapi "${pkgdir}/usr/share/vala/vapi/libconfig.vapi"
}
