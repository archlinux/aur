# Maintainer: Krystof Pistek <krystof1119@gmail.com>
pkgname=cpu-checker-bzr
pkgver=r41
pkgrel=2
pkgdesc="Userspace tools for helping to evaluate the CPU (or BIOS) support for various features."
arch=('x86_64')
url="https://launchpad.net/cpu-checker"
license=('GPL')
depends=('awk' 'grep' 'msr-tools')
makedepends=('bzr' 'make' 'python-dulwich')
source=('bzr+lp:cpu-checker')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/cpu-checker"
	printf "r%s" "$(bzr revno)"
}

package() {
	cd "$srcdir/cpu-checker"
	make DESTDIR="$pkgdir/" install
	mv "$pkgdir/usr/sbin" "$pkgdir/usr/bin"
}
