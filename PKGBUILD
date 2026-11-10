# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>
pkgname=pi-bin
pkgver=1.5.1
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
sha256sums_x86_64=('cb69979c0a8162bf22bcee0762f3c3701a45b51b552fa16a736d467c6068509f')
sha256sums_aarch64=('98f1762f56adc5703f931996ae802216dad490dde0b6793aed1e3bb0383df1f7')

package() {
    install -d "${pkgdir}/usr/lib/pi" "${pkgdir}/usr/bin"
    cp -a --no-preserve=ownership "${srcdir}/pi/." "${pkgdir}/usr/lib/pi/"
    ln -s "/usr/lib/pi/pi" "${pkgdir}/usr/bin/pi"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
