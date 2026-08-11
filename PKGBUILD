pkgname=agent-deck-bin
pkgver=1.11.0
pkgrel=2
pkgdesc="Terminal session manager for AI coding agents"
arch=(x86_64 aarch64)
url="https://github.com/asheshgoplani/agent-deck"
license=(MIT)

depends=("tmux" "glibc")
options=(!strip !debug)
conflicts=("agent-deck")
provides=(agent-deck)

source=("https://github.com/asheshgoplani/agent-deck/releases/download/v1.11.0/agent-deck_1.11.0_linux_amd64.tar.gz")
sha256sums=('b99ca6e61b9518d3a7a1b3487d941f199d8da695c6045afe2b903e2e6d62232b')

prepare() {
    tar -xf "${srcdir}/$(basename "${source}")"
}

package() {
    install -Dm755 "agent-deck" "${pkgdir}/usr/bin/agent-deck"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}"
}