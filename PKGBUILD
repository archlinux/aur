# Maintainer: Tor Vic <torvic9 AT mailbox DOT org>

pkgname='mini-benchmarker'
pkgver=0.9.r142.g953a1b9
pkgrel=1
pkgdesc='A simple benchmarking script using stress-ng, perf, blender etc.'
url="https://gitlab.com/torvic9/bash-scripts/-/tree/master/mini-benchmarker"
arch=('x86_64')
licence=('GPL3')
depends=('gcc' 'make' 'cmake' 'time' 'perf' 'unzip'
	 'nasm' 'inxi' 'argon2' 'wget' 'x265' 'xz' 'zstd'
	 'zlib' 'libdrm' 'git' 'python' 'primesieve')
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
