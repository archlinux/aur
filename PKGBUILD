# Maintainer: agony <27015 at riseup dot net>
pkgname=kqalc-bin
pkgver=0.2.1
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
sha256sums_x86_64=('83c0e49f610c46641866ffa8ec4ae3f10b0e8981854816955bc06c4af7dc435f')
sha256sums_aarch64=('2a4f2c1d8f823e41d73c2080ed2cbeff633334098951eaec7636097f7a4962d8')

package() {
  install -Dm755 kqalc "${pkgdir}/usr/bin/kqalc"
  install -Dm644 dist/org.kde.krunner1.kqalc.desktop \
    "${pkgdir}/usr/share/krunner/dbusplugins/org.kde.krunner1.kqalc.desktop"
  install -Dm644 dist/org.kde.krunner1.kqalc.service \
    "${pkgdir}/usr/share/dbus-1/services/org.kde.krunner1.kqalc.service"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
