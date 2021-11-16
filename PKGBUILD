# Maintainer: Kamil Cukrowski <kamilcukrowski@gmail.com>

pkgname=boost-tool-wave-git
pkgver=2.0
pkgrel=1
pkgdesc="Boost The Wave Driver Executable"
arch=("x86_64")
url="https://www.boost.org/doc/libs/1_77_0/libs/wave/"
license=(custom)
groups=()
depends=(boost-libs)
makedepends=(git)
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
source=("git+https://github.com/boostorg/wave.git" 'https://www.boost.org/LICENSE_1_0.txt')
md5sums=(SKIP e4224ccaecb14d942c71d31bef20d78c)

build() {
	(
		set -x
		g++ $CFLAGS ./wave/tool/cpp.cpp $LDFLAGS -lboost_thread -lboost_filesystem -lboost_wave -lboost_program_options -lboost_timer
	)
}

package() {
	install -d -m755 "$pkgdir"/usr/bin/
	install -m755 ./a.out "$pkgdir"/usr/bin/wave

	install -d -m755 "$pkgdir"/usr/share/licenses/boost-tool-wave-git
	install -m644 -t "$pkgdir"/usr/share/licenses/boost-tool-wave-git/ ./LICENSE_1_0.txt
}
