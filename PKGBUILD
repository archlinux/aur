# Maintainer: Justin Frank <jf.laelath@gmail.com>
pkgname=typingtest-git
pkgver=1.0.3.r0.ba48655
pkgrel=1
pkgdesc="A typing test program desktop program with customizability"
arch=(x86_64)
url="https://github.com/laelath/typingtest"
license=('GPL')
groups=()
depends=('gtkmm3')
makedepends=('git' 'cmake' 'xdg-utils')
backup=()
options=()
install=
source=('typingtest-git::git+https://github.com/laelath/typingtest.git')
noextract=()
md5sums=('SKIP')
pkgver() {
	cd "${srcdir}/typingtest-git"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}
build() {
	cd "${srcdir}/typingtest-git"
	cmake . -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
	make
}
package() {
	cd "${srcdir}/typingtest-git"
	make DESTDIR="$pkgdir/" install
}
