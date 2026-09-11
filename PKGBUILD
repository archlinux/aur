# Maintainer: agony <27015 at riseup dot net>
pkgname=kqalc-bin
pkgver=0.2.2
pkgrel=2
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
install=kqalc-bin.install
source_x86_64=("${url}/releases/download/v${pkgver}/kqalc_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/kqalc_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('74521412b1e4e782f1977db6c6d7d5c9c5f0549b89984550cc92c7a153c20204')
sha256sums_aarch64=('1a5624fcce56a6e01d3e5bde088334bec1b929b5b9f6dd78e4af2bda9b515885')

package() {
  install -Dm755 kqalc "${pkgdir}/usr/bin/kqalc"
  install -Dm644 dist/org.kde.krunner1.kqalc.desktop \
    "${pkgdir}/usr/share/krunner/dbusplugins/org.kde.krunner1.kqalc.desktop"
  install -Dm644 dist/org.kde.krunner1.kqalc.service \
    "${pkgdir}/usr/share/dbus-1/services/org.kde.krunner1.kqalc.service"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
