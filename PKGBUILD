# Maintainer: Quentin Bazin <quent42340 at gmail dot com>

_pkgname=aniproject
pkgname="${_pkgname}-git"
pkgver=0.0.1
pkgrel=1
pkgdesc="Unarelith's aniproject"
arch=("i686" "x86_64")
url="https://git.unarelith.net/Unarelith/aniproject"
depends=("apache" "mod_wsgi" "python" "python-pip" "python-virtualenv")
provides=("aniproject")
source=("${_pkgname}::git+${url}.git")
md5sums=("SKIP")
install=aniproject-git.install

pkgver() {
	cd "${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	# Copy files to package
	mkdir -p "${pkgdir}/usr/share/webapps/aniproject/"
	cp -r "${_pkgname}"/* "${pkgdir}/usr/share/webapps/aniproject/"
}

