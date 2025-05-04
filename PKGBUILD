# Maintainer: Gabriel Bjørnager Jensen <gabriel@achernar.io>

pkgname=setprof-git
pkgver=1.0
pkgrel=1
arch=("any")
url="https://mandelbrot.dk/bjoernager/setprof/"
makedepends=("git")
source=("git+https://gitlab.com/bjoernager/setprof.git/")
sha512sums=("SKIP")

pkgver() {
	cd "${srcdir}/setprof"

	echo -n "$(git describe --abbrev=0)"
}

package() {
	cd "${srcdir}/setprof"

	./install.sh base    "${pkgdir}/usr/bin"
	./install.sh systemd "${pkgdir}/usr/lib/systemd"
}
