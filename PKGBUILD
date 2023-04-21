# Maintainer: Aki-nyan <aur@catgirl.link>

pkgname=eqy-nightly
pkgver=20230421_cc91b45
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
conflicts=()
replaces=()
source=(
	"eqy::git+https://github.com/YosysHQ/eqy.git#commit=cc91b45"
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
