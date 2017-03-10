pkgname=argon2-git
_gitname="phc-winner-argon2"
pkgdesc="The password hash Argon2, winner of PHC"
pkgver=20161029.r31.g6f5427f
pkgrel=1
arch=('i686' 'x86_64')
conflicts=("argon2")
provides=("argon2")
url="https://github.com/P-H-C/phc-winner-argon2"
license=('CC-0')
depends=('glibc')
makedepends=('git')
source=('git://github.com/P-H-C/phc-winner-argon2.git')
sha256sums=('SKIP')

pkgver() {
	cd $_gitname
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd $_gitname
	make
}

check() {
	cd $_gitname
	make test
}

package() {
	cd $_gitname
	make DESTDIR="$pkgdir" install
}
