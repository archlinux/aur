# Maintainer:  EnityBlackHawk <entityblackhawk@gmail.com>
pkgname=devtunnel-cli-git
pkgver=e5b20b7
pkgrel=1
epoch=
pkgdesc="Microsoft's Dev tunnel - CLI"
arch=('x86_64')
url="https://github.com/EnityBlackHawk/devtunnel-cli.git"
license=('MIT')
depends=('libsecret' 'glibc' 'zlib' 'gcc-libs')
makedepends=('git')
source=('git+https://github.com/EnityBlackHawk/devtunnel-cli.git')
md5sums=('SKIP')

pkver(){
	cd "devtunnel-cli"
	git rev-parse --short HEAD
}


build() {
	cd "devtunnel-cli"
	./devtunnel.sh
}

package() {
	cd "devtunnel-cli"
	sudo install ~/bin/devtunnel /usr/local/bin
	rm ~/bin/devtunnel
}
