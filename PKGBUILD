# Maintainer: Justin Frank <jf.laelath@gmail.com>
pkgname=typingtest-git
pkgver=v1.0.1.r0.g16c3f2b
pkgrel=1
pkgdesc="A typing test program desktop program with customizability"
arch=(x86_64)
url="https://github.com/laelath/typingtest"
license=('GPL')
groups=()
depends=('gtk3')
makedepends=('git' 'cmake')
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
	cmake .
	make
}
package() {
	cd "${srcdir}/typingtest-git"
	make DESTDIR="$pkgdir/" install
}
