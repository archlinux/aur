# Maintainer: Aki-nyan <aur@catgirl.link>

pkgname=eqy-nightly
pkgver=20260321_v0.63_3_g3b20c1c
pkgrel=1
epoch=1
pkgdesc="Equivalence Checking with Yosys"
arch=("any")
url="https://github.com/YosysHQ/eqy"
license=("custom:ISC")
groups=()
options=("!strip")
depends=("yosys-nightly" "sby-nightly" "python" "python-click")
optdepends=()
makedepends=("git" "gcc" "yosys-nightly")
provides=("eqy")
conflicts=()
replaces=()
source=(
	"eqy::git+https://github.com/YosysHQ/eqy.git#commit=3b20c1c"
)
sha256sums=(
	"SKIP"
)

_PREFIX="/usr"

build() {
	cd "${srcdir}/eqy"
	make PREFIX="${_PREFIX}"
}

package() {
	cd "${srcdir}/eqy"
	make PREFIX="${_PREFIX}" DESTDIR="${pkgdir}" install
	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/eqy/LICENSE"
	cd ..
}
