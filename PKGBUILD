# Maintainer: Aki-nyan <aur@catgirl.link>

pkgname=mcy-nightly
pkgver=20231129_9052030
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
conflicts=()
replaces=()
source=(
	"mcy::git+https://github.com/YosysHQ/mcy.git#commit=9052030"
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
