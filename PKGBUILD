# Maintainer: Aki-nyan <aur@catgirl.link>

pkgname=sby-nightly
pkgver=20220619_fb5705b
pkgrel=1
epoch=1
pkgdesc="Front-end for Yosys-based formal verification flows"
arch=("any")
url="https://github.com/YosysHQ/sby"
license=("custom:ISC")
groups=()
options=("!strip")
depends=("yosys-nightly" "python")
optdepends=(
	"boolector"
	"yices"
	"z3"
)
makedepends=("git")
conflicts=("symbiyosys-git")
replaces=("symbiyosys-nightly")
source=(
	"symbiyosys::git+https://github.com/YosysHQ/sby.git"#commit=fb5705b
)
sha256sums=(
	"SKIP"
)

_PREFIX="/usr"
package() {
	cd "${srcdir}/symbiyosys"
	make PREFIX="${_PREFIX}" DESTDIR="${pkgdir}" install
	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/symbiyosys/LICENSE"
	cd ..
}
