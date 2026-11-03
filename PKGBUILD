# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>
pkgname=pi-bin
pkgver=1.5.0
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
sha256sums_x86_64=('df870ba0e344cb7b3358d8d8f19397b8b8d225a8669784736ad68a5c2169d53b')
sha256sums_aarch64=('5d5711b48600756473682e86360b026b11abf7591e5d112eb411d4da2c100d9a')

package() {
    install -d "${pkgdir}/usr/lib/pi" "${pkgdir}/usr/bin"
    cp -a --no-preserve=ownership "${srcdir}/pi/." "${pkgdir}/usr/lib/pi/"
    ln -s "/usr/lib/pi/pi" "${pkgdir}/usr/bin/pi"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
