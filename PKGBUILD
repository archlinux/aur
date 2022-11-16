# Maintainer: Tor Vic <torvic9 AT mailbox DOT org>

pkgname='nano-benchmarker'
pkgver=0.9.r131.gc4368b6
pkgrel=1
pkgdesc='A simple benchmarking script using xz, kernel compilation, blender etc.'
url="https://gitlab.com/torvic9/bash-scripts/-/tree/master/nano-benchmarker"
arch=('x86_64')
licence=('GPL3')
depends=('gcc' 'make' 'time' 'unzip' 'xz'
	 'inxi' 'gmp' 'wget' 'blender'
	 'zlib' 'git' 'python')
source=(git+https://gitlab.com/torvic9/bash-scripts.git)
sha512sums=('SKIP')

pkgver() {
	cd bash-scripts/$pkgname
	git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd bash-scripts/$pkgname
	install -Dm755 $pkgname.sh "$pkgdir/usr/bin/$pkgname.sh"
}
