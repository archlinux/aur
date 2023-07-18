# Maintainer: Aki-nyan <aur@catgirl.link>

pkgname=sby-nightly
pkgver=20230718_yosys_0.30_7_g79e6ecf
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
	"sby::git+https://github.com/YosysHQ/sby.git#commit=79e6ecf"
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
