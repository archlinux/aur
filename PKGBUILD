# Maintainer: shiwenwen <shiwenwendevelopment@gmail.com>

pkgname=hope-agent-bin
pkgver=0.40.0
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
sha256sums_x86_64=('5098f470428a89e07f071bf3baee1c7550b58a3988ca4db71b27af47077ed167')

source_aarch64=("hope-agent-${pkgver}-aarch64.deb::${url}/releases/download/v${pkgver}/Hope.Agent_${pkgver}_arm64.deb")
sha256sums_aarch64=('f0c8994e8fb4d35af66e95cd1097e26e8a0a664735acd141e112148c5621ac2c')

package() {
    # `bsdtar` (libarchive) handles `ar`-style .deb archives directly.
    # Source filename is per-arch; resolve it via $CARCH (Arch's host arch).
    bsdtar -xf "${srcdir}/hope-agent-${pkgver}-${CARCH}.deb" -C "${srcdir}"
    bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}"
}
