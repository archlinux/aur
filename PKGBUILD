# Maintainer: shiwenwen <shiwenwendevelopment@gmail.com>

pkgname=hope-agent-bin
pkgver=0.51.0
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
sha256sums_x86_64=('e7dcd249bd87628aa6901b215319f909ed3bd05e6cde189c530fbddc652044ec')

source_aarch64=("hope-agent-${pkgver}-aarch64.deb::${url}/releases/download/v${pkgver}/Hope.Agent_${pkgver}_arm64.deb")
sha256sums_aarch64=('2f3de31a94d4ac775f0ba04b968dab7e563d0461f0a345740d00d436b19a6cb3')

package() {
    # `bsdtar` (libarchive) handles `ar`-style .deb archives directly.
    # Source filename is per-arch; resolve it via $CARCH (Arch's host arch).
    bsdtar -xf "${srcdir}/hope-agent-${pkgver}-${CARCH}.deb" -C "${srcdir}"
    bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}"
}
