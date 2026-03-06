# Maintainer: agony <27015 at riseup dot net>
pkgname=kqalc-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Full qalculate power in KRunner"
arch=('x86_64' 'aarch64')
url="https://github.com/noctuum/kqalc"
license=('GPL-2.0-only')
depends=('libqalculate')
optdepends=(
  'wl-clipboard: clipboard support on Wayland'
  'xclip: clipboard support on X11'
)
provides=('kqalc')
conflicts=('kqalc')
source_x86_64=("${url}/releases/download/v${pkgver}/kqalc_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/kqalc_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('ca283d2f0a0284644b9bd82fc6624a996cef5c16344fbd20316b472f9952b5b6')
sha256sums_aarch64=('435b6ff83ceb9d13a21e61673006b10e27f9fb68ec2c407769e3c780cc7a0a49')

package() {
  install -Dm755 kqalc "${pkgdir}/usr/bin/kqalc"
  install -Dm644 dist/org.kde.krunner1.kqalc.desktop \
    "${pkgdir}/usr/share/krunner/dbusplugins/org.kde.krunner1.kqalc.desktop"
  install -Dm644 dist/org.kde.krunner1.kqalc.service \
    "${pkgdir}/usr/share/dbus-1/services/org.kde.krunner1.kqalc.service"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
