# Maintainer: Aditya Gupta <ag15035 at gmail dot com>
# Maintainer: Abhiram Ranade <ranade at iitb dot ac dot in>
pkgname="simplecpp-git"
pkgdesc="A simple 2D graphics library in C++"
pkgver=1
pkgrel=1
arch=('x86_64')
url="https://github.com/adi-g15/simplecpp"
license=('CC')
depends=('libx11' 'gcc')
makedepends=('git')
provides=("s++")
conflicts=("simplecpp")
#source=('git://github.com/adi-g15/simplecpp.git#branch=dev')
source=('git://github.com/adi-g15/simplecpp.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make -j$(nproc) || make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir" install
}

