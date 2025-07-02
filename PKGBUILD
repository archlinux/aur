# Contributor: adrien Prost-Boucle <adrien.prost-boucle.@laposte.net>

pkgname=vhd2vl-git
pkgver=r138.79dfc88
pkgrel=1
epoch=1
pkgdesc="Translate synthesizable VHDL into Verilog 2001"
arch=('x86_64')
url="http://doolittle.icarus.com/~larry/vhd2vl/"
license=('GPL-2.0-or-later')
depends=('glibc')
makedepends=('git')
source=("git+https://github.com/ldoolitt/vhd2vl.git")
sha256sums=('SKIP')

pkgver() {
	cd vhd2vl
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	make -C vhd2vl
}

package() {
	install -Dm755 -t "$pkgdir/usr/bin" vhd2vl/src/vhd2vl
}
