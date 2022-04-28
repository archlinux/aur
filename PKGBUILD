# Maintainer: Popolon <popolon@popolon.org>

_name=SearchAndRescue2
pkgname=sar2
pkgver=2.5.0
pkgrel=1
pkgdesc='Open-source virtual modular synthesizer'
url="https://searchandrescue2.github.io/sar2/"
license=('GPL2')
arch=('x86_64' 'armv7h' 'aarch64' 'riscv32' 'riscv64')
depends=('freealut' 'openal' 'libvorbis' 'sdl2' 'libsm' 'libxmu' 'libxpm')
makedepends=('scons' 'gcc')
source=(
	"https://github.com/$_name/$pkgname/archive/v$pkgver.tar.gz"
)
sha512sums=(
	'b5e6036e9ca0bce4245b951cdc16e676470f95906c714b28facf0006c4db838d86dbb57982712fa5f6abb9bd774c61b9d1c593c82b08325e9f28db25273a194a'
)

build() {
	cd "$pkgname-$pkgver"
	scons
}

package() {
	cd "$pkgname-$pkgver"
        scons install --prefix=${pkgdir}/usr
#  install -Dm755 libnu.so "${pkgdir}/usr/lib/libnu.so"
#  install -Dm644 nu.h "${pkgdir}/usr/include/nu.h"
#  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/$pkgname/LICENSE.txt"
#	install -vDm 644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname"
}
