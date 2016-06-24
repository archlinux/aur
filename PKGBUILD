# Maintainer: Michal Koutenský <koutak.m@gmail.com>
pkgname=mmkeyosd-git
pkgver=r55.7a595c0
pkgrel=1
pkgdesc="Use multimedia keys to change stuff and display an OSD"
arch=('i686' 'x86_64')
url="https://github.com/dapus/mmkeyosd"
license=()
groups=()
depends=('libxft' 'libxinerama')
makedepends=('git')
provides=("${mmkeyosd%-git}")
conflicts=("${mmkeyosd%-git}")
replaces=()
backup=()
options=()
install=
source=("git://github.com/dapus/mmkeyosd.git")
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make PREFIX=/usr DESTDIR="$pkgdir/" install
}
