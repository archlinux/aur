# Maintainer: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>

pkgname=opkg-utils-git
pkgver=r60.fc6eb29
pkgrel=1
pkgdesc="Helper scripts for use with the opkg package manager"
arch=('x86_64')
url="https://git.yoctoproject.org/cgit/cgit.cgi/opkg-utils"
license=('GPL')
makedepends=('git')
conflicts=(opkg-utils)
source=("git+http://git.yoctoproject.org/git/opkg-utils#branch=master")
sha256sums=('SKIP')

pkgver() {
	cd opkg-utils
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd opkg-utils
	make
}

package() {
	cd opkg-utils
	make PREFIX="/usr" DESTDIR="$pkgdir/" install
}
