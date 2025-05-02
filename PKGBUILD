# Maintainer: Aki-nyan <aur@catgirl.link>

pkgname=mcy-nightly
pkgver=20250502_v0.52_2_g7f88a49
pkgrel=1
epoch=1
pkgdesc="Mutation Cover with Yosys"
arch=("any")
url="https://github.com/YosysHQ/mcy"
license=("custom:ISC")
groups=()
options=("!strip")
depends=("yosys-nightly" "sby-nightly" "python" "python-click" "qt5-base" "boost-libs")
optdepends=("python-flask")
makedepends=("git" "gcc" "cmake" "boost")
provides=("mcy")
conflicts=()
replaces=()
source=(
	"mcy::git+https://github.com/YosysHQ/mcy.git#commit=7f88a49"
)
sha256sums=(
	"SKIP"
)

_PREFIX="/usr"
package() {
	cd "${srcdir}/mcy"
	make PREFIX="${_PREFIX}" DESTDIR="${pkgdir}" install
	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/mcy/LICENSE"
	cd ..
}
