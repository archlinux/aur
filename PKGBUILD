# Maintainer: Aki-nyan <aur@catgirl.link>

pkgname=sby-nightly
pkgver=20240621_yosys_0.42_2_gc9e3b82
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
	"sby::git+https://github.com/YosysHQ/sby.git#commit=c9e3b82"
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
