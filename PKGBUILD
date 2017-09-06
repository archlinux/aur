# Maintainer: Denton Liu <liu.denton@gmail.com>

pkgname=based-connect-git
_gitname="${pkgname%-git}"
pkgver=r79.2f5c7ff
pkgrel=1
pkgdesc='A reverse-engineered Bose Connect imitation program for Linux.'
arch=('i686' 'x86_64')
url='https://github.com/Denton-L/based-connect'
license=('GPL3')
depends=('bluez-libs')
makedepends=('git')
provides=("$_gitname")
conflicts=("$_gitname")
source=('git+https://github.com/Denton-L/based-connect.git')
md5sums=('SKIP')

pkgver() {
	cd "$_gitname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_gitname"
	make
}

package() {
	cd "$_gitname"
	make DESTDIR="$pkgdir" PREFIX="/usr" install
}
