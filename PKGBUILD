# Maintainer: cafehaine <cafehaine at gmail doc com>
pkgname=coffeestatus-git
_realname=coffeestatus
pkgrel=1
pkgver=r41.8e109b1
pkgdesc='A simple status generator for i3 written in lua, meant to be modular.'
arch=('any')
url=https://github.com/cafehaine/coffeestatus
license=('MIT')
provides=("coffeestatus")
depends=("lua-socket" "lua-posix" "lua-luajson")
makedepends=('git')
source=("git+https://github.com/cafehaine/coffeestatus.git")
sha512sums=('SKIP')

pkgver() {
	cd "$srcdir/$_realname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/$_realname"
	install -d "${pkgdir}/usr/share/licenses/${pkgname}"
	install LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	INSTALLROOT="${pkgdir}" bash install.sh
}

