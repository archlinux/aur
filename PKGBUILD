# Maintainer: alive4ever <alive4ever at live.com>
pkgname=opendoas-git
pkgver=r142.6ed45e5
pkgrel=1
pkgdesc="Run commands as super user or another user"
arch=('x86_64')
url="https://github.com/Duncaen/OpenDoas"
license=('ISC')
#depends=()
makedepends=('git')
install=opendoas.install
source=("${pkgname}::git+https://github.com/Duncaen/OpenDoas.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

build() {
	cd "$srcdir/${pkgname}"
	./configure --prefix=/usr
	make V=s
}

package() {
	cd "$srcdir/${pkgname}"
	make V=s DESTDIR="$pkgdir/" install
}
