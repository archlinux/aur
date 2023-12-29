# Maintainer: Popoplon <popolon(aLpopolon.org>

_pkgname=libretro-lutro
pkgname=libretro-lutro-git
pkgver=r596.09a134e
pkgrel=1
arch=('aarch64' 'armv7h' 'i486' 'i686' 'pentium4' 'riscv32' 'riscv64' 'x86_64')
url="https://github.com/libretro/${_pkgname}"
license=('MIT')
groups=('libretro')
depends=('gcc-libs' 'glibc' 'libretro-core-info')
makedepends=('git')
source=("${_pkgname}::git+${url}")
b2sums=('SKIP')

pkgver() {
	cd ${_pkgname}
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd ${_pkgname}
	make
}

package() {
	cd ${_pkgname}
	install -D -t "$pkgdir"/usr/lib/libretro lutro_libretro.so
}
