# Maintainer: Egor Panasenko <gaura.panasenko@gmail.com>
pkgname=mrun-git
pkgver=r1.8d85c12
pkgrel=1
pkgdesc="Mini Run Program"
arch=("any")
url=""
license=('GPL')
groups=()
depends=("gtk3")
makedepends=("git" "vala")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=("git://github.com/gaurapanasenko/${pkgname%-git}.git")
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	./autogen.sh --prefix=/usr
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}
