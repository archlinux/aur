# Maintainer: Kamil Cukrowski <kamilcukrowski@gmail.com>

pkgname=boost-tool-wave-git
pkgver=2.0
pkgrel=1
pkgdesc="The Wave Driver Executable"
arch=(any)
url="https://www.boost.org/doc/libs/1_76_0/libs/wave/"
license=(custom)
groups=()
depends=(boost)
makedepends=(git)
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
source=("git+https://github.com/boostorg/wave.git")
md5sums=(SKIP)

build() {
	(
		set -x
		g++ $CFLAGS ./wave/tool/cpp.cpp -lboost_thread -lboost_filesystem -lboost_wave -lboost_program_options -lboost_timer
	)
}

package() {
	install -d -m755 "$pkgdir"/usr/bin/
	install -m755 ./a.out "$pkgdir"/usr/bin/wave
}
