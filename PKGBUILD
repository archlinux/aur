# Maintainer: Ícar N. S. <icar.nin@protonmail..com>
_name=cpuctl
pkgname=$_name-git
pkgver=0.0.1
pkgrel=1
pkgdesc="Simple CPU scaling governor utility for CPUFreq"
arch=(any)
url="https://gitlab.com/juxuanu/cpuctl"
license=('GPLv2')
makedepends=(nim nimble)
provides=(cpuctl)
conflicts=(cpuctl cpuctl-git)
source=('cpuctl::git+https://gitlab.com/juxuanu/cpuctl.git#branch=main')
md5sums=('SKIP')

build() {
	cd "$_name"
	nimble build \
		-d:release # comment out for debug symbols
}

package() {
	cd "$_name"
	install -Dm551 cpuctl "$pkgdir"/usr/bin/cpuctl
}
