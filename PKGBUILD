# Maintainer: shiwenwen <shiwenwendevelopment@gmail.com>

pkgname=hope-agent-bin
pkgver=0.10.1
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
sha256sums_x86_64=('fb0557e8adbdcf378c023f03bdb326b26f3def10390ccd5f330e959178361b86')

source_aarch64=("hope-agent-${pkgver}-aarch64.deb::${url}/releases/download/v${pkgver}/Hope.Agent_${pkgver}_arm64.deb")
sha256sums_aarch64=('292698e18d2b11f8f34b5dda204e40fa0e69fd0e9698f2fabda3d6a178b33736')

package() {
    # `bsdtar` (libarchive) handles `ar`-style .deb archives directly.
    # Source filename is per-arch; resolve it via $CARCH (Arch's host arch).
    bsdtar -xf "${srcdir}/hope-agent-${pkgver}-${CARCH}.deb" -C "${srcdir}"
    bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}"
}
