# Maintainer: Peter Jung <admin@ptr1337.dev>

pkgname=schbench-git
_pkgname=schbench
pkgver=v1.0.r4.g48aed1d
pkgrel=1
arch=('any')
license=('GPL2')
pkgdesc='Simple Scheduler Benchmark'
source=("git+https://git.kernel.org/pub/scm/linux/kernel/git/mason/schbench.git")
sha256sums=('SKIP')
provides=(schbench)

pkgver() {
    cd $srcdir/$_pkgname
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd $_pkgname
	make
	
}
package() {
	cd $srcdir/$_pkgname
 	install -Dm755 schbench "$pkgdir"/usr/bin/schbench
}
