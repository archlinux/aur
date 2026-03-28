# Maintainer: y0sif <https://github.com/y0sif>
pkgname=ferlay-bin
pkgver=0.1.0
pkgrel=1
pkgdesc='Start and manage Claude Code sessions from your phone'
arch=('x86_64' 'aarch64')
url='https://github.com/y0sif/ferlay'
license=('MIT')
depends=('gcc-libs')
provides=('ferlay')
conflicts=('ferlay')
source_x86_64=("${url}/releases/download/v${pkgver}/ferlay-daemon-linux-x86_64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/ferlay-daemon-linux-aarch64.tar.gz")
sha256sums_x86_64=('086ccde40c3d88a040147b751a7061e4795ef5272eeb4e8eb07ad9530a67b0c6')
sha256sums_aarch64=('5469d5717445f6cf5d242e2379dcfe7fd52e569637081086652bc6601bef784c')

package() {
  if [ "$CARCH" = "x86_64" ]; then
    install -Dm755 ferlay-daemon-linux-x86_64 "$pkgdir/usr/bin/ferlay"
  else
    install -Dm755 ferlay-daemon-linux-aarch64 "$pkgdir/usr/bin/ferlay"
  fi
}
