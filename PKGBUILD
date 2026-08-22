pkgname=agent-deck-bin
pkgver=1.14.0
pkgrel=2
pkgdesc="Terminal session manager for AI coding agents"
arch=(x86_64 aarch64)
url="https://github.com/asheshgoplani/agent-deck"
license=(MIT)

depends=("tmux" "glibc")
options=(!strip !debug)
conflicts=("agent-deck")
provides=(agent-deck)

source=("https://github.com/asheshgoplani/agent-deck/releases/download/v1.14.0/agent-deck_1.14.0_linux_amd64.tar.gz")
sha256sums=('7150b6c0fb9413206aac03d80322084a97db40b8fe11e02db9a0395a1aaf4cb0')

prepare() {
    tar -xf "${srcdir}/$(basename "${source}")"
}

package() {
    install -Dm755 "agent-deck" "${pkgdir}/usr/bin/agent-deck"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}"
}