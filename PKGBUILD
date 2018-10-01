# Maintainer: Marco Cameriero <aur@marcocameriero.net>
pkgname=simplylock-git
pkgver=0.6.r0.g5fab18f
pkgrel=1
pkgdesc="A simple and lightweight Linux console locking tool."
arch=('i686' 'x86_64')
url="https://github.com/95ulisse/simplylock"
license=('MIT')
depends=(pam imagemagick)
makedepends=('git')
source=('simplylock::git+https://github.com/95ulisse/simplylock.git')
md5sums=('SKIP')

pkgver() {
	cd "simplylock"
	printf "%s" "$(git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')"
}

build() {
	cd "simplylock"
	make
}

package() {
	install -dm755 "$pkgdir"/usr/bin
	install -Dm4755 "$srcdir"/simplylock/out/simplylock "$pkgdir"/usr/bin
}
