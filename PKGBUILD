# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>
pkgname=pi-bin
pkgver=1.6.1
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
sha256sums_x86_64=('3c7f00715eb512e165c0da8cad314d73c83b54d5bf7748be4adc618fc8357b68')
sha256sums_aarch64=('afde641d6c5904d26960ddb4223bf563b0860cf1a0ebc443b85deff67d048753')

package() {
    install -d "${pkgdir}/usr/lib/pi" "${pkgdir}/usr/bin"
    cp -a --no-preserve=ownership "${srcdir}/pi/." "${pkgdir}/usr/lib/pi/"
    ln -s "/usr/lib/pi/pi" "${pkgdir}/usr/bin/pi"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
