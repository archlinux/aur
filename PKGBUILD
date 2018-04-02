# Maintainer: Antoni Kepinski <hello[at]akepinski[dot]me>
pkgname=archfetch
pkgver=1.0.4
pkgrel=4
pkgdesc="Neofetch, but simplified. For Arch Linux."
url="https://github.com/xxczaki/archfetch/"
arch=('i686' 'x86_64')
license=('MIT')
depends=()
makedepens=('git')
source=("git+git://github.com/xxczaki/archfetch.git")

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "${PKGMK_SOURCE_DIR}" && cd "${pkgname}"
 	git fetch -q
	git reset --hard origin/master
	sudo install -Dm755 archfetch "${PKG}/usr/bin/archfetch"
}
