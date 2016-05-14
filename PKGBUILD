# Maintainer: Marcin Kornat <rarvolt+aur@gmail.com>

pkgname=esptool2-git
pkgver=1
pkgrel=1
pkgdesc="An esp8266 rom creation tool"
arch=('i686' 'x86_64')
url="https://github.com/raburton/esptool2"
license=('GPL3')
depends=('glibc')
makedepends=('git')
source=(esptool2::git+https://github.com/raburton/esptool2.git)
md5sums=('SKIP')

version() {
	cd "esptool2"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "esptool2"
	make
}

package() {
	cd "$srcdir/esptool2"
	install -Dm755  esptool2 "${pkgdir}/usr/bin/esptool2"
}

