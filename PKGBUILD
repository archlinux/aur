# Maintainer: shiwenwen <shiwenwendevelopment@gmail.com>

pkgname=hope-agent-bin
pkgver=0.3.0
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
sha256sums_x86_64=('9b112631e390d1bda9a70bcd0225c4cbe7ebfc7135bdfb1798366db0941b5997')

source_aarch64=("hope-agent-${pkgver}-aarch64.deb::${url}/releases/download/v${pkgver}/Hope.Agent_${pkgver}_arm64.deb")
sha256sums_aarch64=('e53ff0fef372867248b1abb175019c0d6483e7bbf374bf493b828400251e2577')

package() {
    # `bsdtar` (libarchive) handles `ar`-style .deb archives directly.
    # Source filename is per-arch; resolve it via $CARCH (Arch's host arch).
    bsdtar -xf "${srcdir}/hope-agent-${pkgver}-${CARCH}.deb" -C "${srcdir}"
    bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}"
}
