# Maintainer: Ethan Zonca <e@ethanzonca.com>
pkgname=cronolog-git
_pkgname=cronolog
pkgver=1.6.3
pkgrel=1
pkgdesc="A log rotation utility"
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/WayneD/cronolog"
license=('GPL2')
source=("git+https://github.com/WayneD/cronolog.git")
md5sums=('SKIP')

prepare() {
	cd "$_pkgname"
	aclocal
	autoconf
	automake --add-missing
}

build() {
	cd "$_pkgname"
	./configure --prefix=/usr --exec-prefix=/usr --bindir=/usr/bin --sbindir=/usr/bin
	make
}

check() {
	cd "$_pkgname"
	make -k check
}

package() {
	cd "$_pkgname"
	make DESTDIR="$pkgdir/" install
}
