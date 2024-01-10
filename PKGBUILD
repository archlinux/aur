# Maintainer: Sahan Fernando <sahan.h.fernando@gmail.com>

pkgname=('serve-d-bin')
pkgver=0.7.6
pkgrel=1
pkgdesc="Microsoft language server protocol implementation for D using workspace-d (Binary Distribution)"
arch=('x86_64')
url="https://github.com/Pure-D/serve-d"
license=("MIT")
groups=('dlang')
provides=('serve-d')
conflicts=('serve-d')
depends=('glibc' 'gcc-libs')

source=(
    "https://github.com/Pure-D/serve-d/releases/download/v${pkgver}/serve-d_${pkgver}-linux-${CARCH}.tar.xz"
    "https://raw.githubusercontent.com/Pure-D/serve-d/v${pkgver}/LICENSE"
)

sha256sums=('48e135a60523cf22ef3265d76aee338357543405f6731503cf550efb45e4d6bc'
            '84ffe9d8aa1f01fef7df2efb5525e66ff2c1c4dea65d65674e42b8d615023c98')

package() {
	# binaries
	install -Dm755 "$srcdir/serve-d" "$pkgdir/usr/bin/serve-d"

	# license
	install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
