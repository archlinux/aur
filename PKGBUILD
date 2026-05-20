pkgname=agent-deck-bin
pkgver=1.9.22
pkgrel=1
pkgdesc="Terminal session manager for AI coding agents"
arch=(x86_64 aarch64)
url="https://github.com/asheshgoplani/agent-deck"
license=(MIT)

depends=("tmux" "glibc")
options=(!strip !debug)
conflicts=("agent-deck")
provides=(agent-deck)

source=("https://github.com/asheshgoplani/agent-deck/releases/download/v1.9.22/agent-deck_1.9.22_linux_amd64.tar.gz")
sha256sums=('aa3379d1be0b9b8e0cb39f7e48f1daa9edb35446a43f385fc1b8f6b441b9032f')

prepare() {
    tar -xf "${srcdir}/$(basename "${source}")"
}

package() {
    install -Dm755 "agent-deck" "${pkgdir}/usr/bin/agent-deck"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}"
}