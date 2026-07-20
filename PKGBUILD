# Maintainer: shiwenwen <shiwenwendevelopment@gmail.com>

pkgname=hope-agent-bin
pkgver=0.21.0
pkgrel=1
pkgdesc='Local-first AI assistant desktop app — cross-device sessions, IM channel routing'
arch=('x86_64' 'aarch64')
url='https://github.com/shiwenwen/hope-agent'
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator')
provides=('hope-agent')
conflicts=('hope-agent')
options=('!strip' '!debug')

source_x86_64=("hope-agent-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/Hope.Agent_${pkgver}_amd64.deb")
sha256sums_x86_64=('1b01d0a858ef7b566e574ff0ebab28121adca042852d44bd3a18fcd3fb575ce4')

source_aarch64=("hope-agent-${pkgver}-aarch64.deb::${url}/releases/download/v${pkgver}/Hope.Agent_${pkgver}_arm64.deb")
sha256sums_aarch64=('be457ffc9d389082ea37b03cc76e2a9c8914b513cd937e5a12a79a3ecf9bac4b')

package() {
    # `bsdtar` (libarchive) handles `ar`-style .deb archives directly.
    # Source filename is per-arch; resolve it via $CARCH (Arch's host arch).
    bsdtar -xf "${srcdir}/hope-agent-${pkgver}-${CARCH}.deb" -C "${srcdir}"
    bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}"
}
