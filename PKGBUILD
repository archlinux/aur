# Maintainer: Hadi Chahine <hadi dot n dot chahine at gmail dot com>
pkgname=cest-git
pkgver=r101.338b675
pkgrel=1
pkgdesc="A traditional unit testing library for C."
arch=('i686' 'x86_64')
url="https://github.com/hadichahine/cest"
license=('MIT')
depends=('glibc')
makedepends=('git' 'gcc')
source=("$pkgname::git://github.com/hadichahine/cest.git")
md5sums=('SKIP')

pkgver(){
	  cd "$pkgname/"
	  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$pkgname/"
	make
}

check() {
	cd "$pkgname/"
	make -k check
}

package() {
	cd "$pkgname/"
	mkdir "$pkgdir/usr/"
	make install INSTALL_DIR="$pkgdir/usr/"
}
