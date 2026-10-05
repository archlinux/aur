# Maintainer: chabandou <chabandou@gmail.com>
pkgname=poise-bin
pkgver=1.1.0
pkgrel=9
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
optdepends=('rnnoise: RNNoise engine (same model as EasyEffects)')

source=("poise-${pkgver}::${url}/releases/download/v${pkgver}/poise")
sha256sums=('0916bb4e00b4f197d900f2799520f18f8e102029e6de0a0326b7910d652ad5b6')

# Don't strip the binary - Nuitka onefile binaries get corrupted by strip
options=('!strip')

package() {
    install -Dm755 "$srcdir/poise-${pkgver}" "$pkgdir/usr/bin/poise"
}
