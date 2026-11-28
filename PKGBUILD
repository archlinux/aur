# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>
pkgname=pi-bin
pkgver=1.7.0
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

sha256sums=('4780a6e9d4b2213784027092b8f305d49059728495fab1ddb93f3c6fb8b283c7')
sha256sums_x86_64=('42f7ed67e83f727fe51dd2746d50dc45c7d1784159a9518296a282402ac68f4a')
sha256sums_aarch64=('cd209cfc90fb94fb4b00ccd785a8d64a4a154f924e52f88febeb6cf36d5c9a24')

package() {
    install -d "${pkgdir}/usr/lib/pi" "${pkgdir}/usr/bin"
    cp -a --no-preserve=ownership "${srcdir}/pi/." "${pkgdir}/usr/lib/pi/"
    ln -s "/usr/lib/pi/pi" "${pkgdir}/usr/bin/pi"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
