# Maintainer: y0sif <https://github.com/y0sif>
pkgname=ferlay-bin
pkgver=0.1.1
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
sha256sums_x86_64=('71d7704d57e1155c4228fd17385be3d1969be938ebc49fcf388b6c2931406d4e')
sha256sums_aarch64=('c4395d588c2bd74698fcb16e2ff2fc33eb824630082022b2bd5cfd477d4ecb85')

package() {
  if [ "$CARCH" = "x86_64" ]; then
    install -Dm755 ferlay-daemon-linux-x86_64 "$pkgdir/usr/bin/ferlay"
  else
    install -Dm755 ferlay-daemon-linux-aarch64 "$pkgdir/usr/bin/ferlay"
  fi
}
