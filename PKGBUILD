# Maintainer: chabandou <chabandou@gmail.com>
pkgname=poise-bin
pkgver=1.0.0
pkgrel=2
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

# Use curl with -L to follow redirects
DLAGENTS=('https::/usr/bin/curl -fLC - --retry 3 --retry-delay 3 -o %o %u')

source=("poise-${pkgver}::${url}/releases/download/v${pkgver}/poise")
sha256sums=('SKIP')  # GitHub redirects make checksum verification unreliable

package() {
    install -Dm755 "$srcdir/poise-${pkgver}" "$pkgdir/usr/bin/poise"
}
