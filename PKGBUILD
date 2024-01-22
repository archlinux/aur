# Maintainer: Tor Vic <torvic9 AT mailbox DOT org>

pkgname='mini-benchmarker'
_ver=2.0
pkgver=2.0.r9.g8f7b6d5
pkgrel=1
pkgdesc='A simple benchmarking script using stress-ng, perf, blender etc.'
url="https://gitlab.com/torvic9/mini-benchmarker"
arch=('x86_64')
licence=('GPL3')
depends=('gcc' 'make' 'cmake' 'time' 'perf' 'unzip'
	 'nasm' 'inxi' 'argon2' 'wget' 'x265' 'xz' 'zstd'
	 'zlib' 'libdrm' 'git' 'python' 'primesieve' 'p7zip')
source=(git+https://gitlab.com/torvic9/mini-benchmarker.git)
sha512sums=('SKIP')

pkgver() {
	cd $pkgname
	echo "${_ver}.r$(git rev-list HEAD --count).g$(git rev-list HEAD -1 --abbrev-commit)"
}

package() {
	cd $pkgname
	install -Dm755 $pkgname.sh "$pkgdir/usr/bin/$pkgname.sh"
}
