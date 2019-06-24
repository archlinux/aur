# Maintainer: Quentin Bazin <quent42340 at gmail dot com>

_pkgname=dtfp
pkgname="${_pkgname}-git"
pkgver=0.0.1
pkgrel=1
pkgdesc="Tool for partners"
arch=("i686" "x86_64")
url="ssh://git@git.mysoftfactory.com/Donos/dtfp"
depends=("apache" "mod_wsgi" "python" "python-pip" "python-virtualenv")
provides=("dtfp")
source=("${_pkgname}::git+${url}.git")
md5sums=("SKIP")
install=dtfp-git.install

pkgver() {
	cd "${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	# Copy files to package
	mkdir -p "${pkgdir}/usr/share/webapps/dtfp/"
	cp -r "${_pkgname}"/* "${pkgdir}/usr/share/webapps/dtfp/"
}

