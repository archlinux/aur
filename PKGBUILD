# Maintainer: chabandou <chabandou@gmail.com>
pkgname=poise-bin
pkgver=1.0.0
pkgrel=3
pkgdesc="Real-time system audio denoiser and voice isolator with TUI (prebuilt binary)"
arch=('x86_64')
url="https://github.com/chabandou/Poise-Voice-Isolator"
license=('MIT')
depends=(
    'glibc'
    'libpulse'
)
provides=('poise')
conflicts=('poise')

source=("poise-${pkgver}::${url}/releases/download/v${pkgver}/poise")
sha256sums=('SKIP')

# Don't strip the binary - Nuitka onefile binaries get corrupted by strip
options=('!strip')

package() {
    install -Dm755 "$srcdir/poise-${pkgver}" "$pkgdir/usr/bin/poise"
}
