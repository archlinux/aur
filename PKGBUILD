# Maintainer: Antoni Kepinski <a[at]kepinski[dot]me>
pkgname=archfetch
pkgver=1.0.7
pkgrel=5
pkgdesc="Simple CLI system information tool for Arch Linux."
url="https://github.com/xxczaki/archfetch/"
arch=('i686' 'x86_64')
license=('MIT')
makedepends=('git')
_gitroot="git://github.com/xxczaki/archfetch.git"
_gitname="archfetch"

package() {	
	cd "${PKGMK_SOURCE_DIR}"

	if cd "${pkgname}"; then
		git fetch -q
		git reset --hard origin/master
	else
		git clone ${_gitroot} ${_gitname}
		cd "${pkgname}"
	fi

	sudo install -Dm755 archfetch "${PKG}/usr/bin/archfetch"
	echo 'archfetch successfully installed!'
}
