# Maintainer: TheJackiMonster <jacki AT thejackimonster DOT de>

_appname='knock-knock'
pkgname="${_appname}-git"
pkgver='r48.0dfa3ec'
pkgrel=1
pkgdesc='Application to interact with SSH doors'
arch=('x86_64' 'aarch64')
url="https://gitlab.com/TheJackiMonster/${_appname}"
license=('AGPL')
makedepends=('sh')
depends=('python3' 'gtk4' 'libadwaita' 'openssh' 'iputils')
provides=("${_appname}")
conflicts=("${_appname}" "${_appname}-bin")
source=("git+https://gitlab.com/TheJackiMonster/${_appname}.git")
md5sums=('SKIP')

pkgver() {
	cd "${_appname}"
	printf "'r%s.%s'" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${srcdir}/${_appname}"
	./scripts/install.sh --skip-update $pkgdir/usr
}

