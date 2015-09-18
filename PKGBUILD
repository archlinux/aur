# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=soul
pkgver=1.0
pkgrel=2
epoch=
pkgdesc="simple netsoul client"
arch=('x86_64' 'i686')
url=""
license=('MIT')
groups=()
depends=('glibc' 'libbsd')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/lse/soul/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz")
noextract=()
md5sums=('72f5739c8fccc31592d3ae3ce3ca32d5')

prepare() {
	cd "$pkgname-$pkgver"
}

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

check() {
	cd "$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
