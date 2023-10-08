# Maintainer: Brian Steffens <briansteffens@gmail.com>
# Maintainer: Lancia Greggori <lanciagreggori@gmail.com>

pkgname=vex
pkgver=0.0.1
pkgrel=2
pkgdesc='Executes all permutations of a shell command with a pattern syntax'
arch=('x86_64')
url="https://github.com/briansteffens/vex"
license=('GPL')
depends=('gcc-libs')
makedepends=('rust' 'cargo')
source=("${pkgname%-*}::git+https://github.com/briansteffens/vex.git")
md5sums=('SKIP')

build() {
	cd "${srcdir}/${pkgname}"
	cargo build --release
}

package() {
	cd "${srcdir}/${pkgname}"
	make DESTDIR="$pkgdir/" install
}
