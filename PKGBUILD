# Maintainer: Darjan Krijan [https://disc-kuraudo.eu]

_pkgname="psl1ght"
pkgname="ps3-${_pkgname}-rules"
pkgver="20230307"
pkgrel=2
pkgdesc="PSL1GHT lightweight PS3 GameOS SDK - rules only"
arch=(x86_64 aarch64 powerpc64le powerpc64 powerpc riscv64)
url='https://github.com/ps3dev'
license=(MIT)
depends=(
	ps3-ppu-binutils
	ps3-ppu-gcc
	ps3-spu-binutils
	ps3-spu-gcc
)
options=(!emptydirs)
source=(
	"git+https://github.com/disc-kuraudo/PSL1GHT.git#commit=45cadf3bd523c9f26c5b0d8b536e59160ab0a54c"
)
sha256sums=(
	'SKIP'
)

# PS3DEV
export PS3DEV="/opt/ps3dev"
export PSL1GHT="${PS3DEV}"
export PATH="${PATH}:${PS3DEV}/bin"
export PATH="${PATH}:${PS3DEV}/ppu/bin"
export PATH="${PATH}:${PS3DEV}/spu/bin"

package() {
	cd PSL1GHT

	make DESTDIR="${pkgdir}" install-ctrl
}
