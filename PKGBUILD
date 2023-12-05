# Maintainer: Aki-nyan <aur@catgirl.link>

pkgname=sby-nightly
pkgver=20231205_yosys_0.35_2_gf0f140c
pkgrel=1
epoch=1
pkgdesc="Front-end for Yosys-based formal verification flows"
arch=("any")
url="https://github.com/YosysHQ/sby"
license=("custom:ISC")
groups=()
options=("!strip")
depends=("yosys-nightly" "python" "python-click")
optdepends=(
	"boolector"
	"yices"
	"z3"
)
makedepends=("git")
conflicts=("symbiyosys-git")
replaces=("symbiyosys-nightly")
source=(
	"sby::git+https://github.com/YosysHQ/sby.git#commit=f0f140c"
)
sha256sums=(
	"SKIP"
)

_PREFIX="/usr"
package() {
	cd "${srcdir}/sby"
	make PREFIX="${_PREFIX}" DESTDIR="${pkgdir}" install
	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/sby/LICENSE"
	cd ..
}
