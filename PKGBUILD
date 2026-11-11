# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>
pkgname=pi-bin
pkgver=1.5.2
pkgrel=1
pkgdesc="AI agent toolkit: unified LLM API, agent loop, TUI, coding agent CLI (pi-mono)"
arch=('x86_64' 'aarch64')
url="https://github.com/earendil-works/pi"
license=('MIT')
depends=('glibc')
options=('!strip' '!debug' '!lto')
optdepends=('tmux: for background bash capabilities')
provides=('pi')
conflicts=('pi')

source=("LICENSE::https://raw.githubusercontent.com/earendil-works/pi/v${pkgver}/LICENSE")
source_x86_64=("pi-linux-x64-${pkgver}-${pkgrel}.tar.gz::https://github.com/earendil-works/pi/releases/download/v${pkgver}/pi-linux-x64.tar.gz")
source_aarch64=("pi-linux-arm64-${pkgver}-${pkgrel}.tar.gz::https://github.com/earendil-works/pi/releases/download/v${pkgver}/pi-linux-arm64.tar.gz")

sha256sums=('0457f5bcec3b3b211605dfb5d1a49042fd638f3686a410fe099c24a25af13c48')
sha256sums_x86_64=('811c6f2c9e7aaee252b5404252e556fb713aa209c1f7f924226aa77d4ef70cb5')
sha256sums_aarch64=('42805cd5615952fcbbfc9c56b04f8feb84395134952e169a6cdc8d7676975666')

package() {
    install -d "${pkgdir}/usr/lib/pi" "${pkgdir}/usr/bin"
    cp -a --no-preserve=ownership "${srcdir}/pi/." "${pkgdir}/usr/lib/pi/"
    ln -s "/usr/lib/pi/pi" "${pkgdir}/usr/bin/pi"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
