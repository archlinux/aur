# Maintainer: Your Name <Amazingminecrafter2015@gmail.com>
pkgname=ion-shell
_tag=ion
pkgver=master
pkgrel=1
pkgdesc="a modern system shell that features a simple, yet powerful, syntax."
arch=(x86_64)
url="https://gitlab.redox-os.org/redox-os/ion/"
license=('MIT')
makedepends=("rustup" "git")
depends=("gcc-libs")
source=("git+https://gitlab.redox-os.org/redox-os/ion/")
install=${_tag}.install
sha256sums=('SKIP')

build() {
	rustup toolchain install 1.39.0
	cd ./${_tag}
	RUSTUP=0 make
}

package() {
	cd ./${_tag}
	make install prefix=${pkgdir}/usr

}
