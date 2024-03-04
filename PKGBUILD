# Maintainer: killab33z <killab33z @ protonmail-dot-com>
# Previous Maintainer: Krystof Pistek <krystof1119 at gmail dot com>
pkgname=cpu-checker-bzr
pkgver=r41
pkgrel=5
pkgdesc="Userspace tools for helping to evaluate the CPU (or BIOS) support for various features."
arch=('x86_64')
url="https://launchpad.net/cpu-checker"
license=('GPL')
depends=('grep' 'msr-tools')
makedepends=('bzr' 'make' 'python-dulwich' 'python-launchpadlib')
provides=("cpu-checker=${pkgver}")
conflicts=(cpu-checker)
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
