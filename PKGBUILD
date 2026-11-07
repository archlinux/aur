pkgname=agent-deck-bin
pkgver=1.16.38
pkgrel=1
pkgdesc="Terminal session manager for AI coding agents"
arch=(x86_64 aarch64)
url="https://github.com/asheshgoplani/agent-deck"
license=(MIT)

depends=("tmux" "glibc")
options=(!strip !debug)
conflicts=("agent-deck")
provides=(agent-deck)

source=("https://github.com/asheshgoplani/agent-deck/releases/download/v1.16.38/agent-deck_1.16.38_linux_amd64.tar.gz")
sha256sums=('f7971f893cfc0e255fb6bdd281bef2119915e832d6970f386284127b00b63536')

prepare() {
    tar -xf "${srcdir}/$(basename "${source}")"
}

package() {
    install -Dm755 "agent-deck" "${pkgdir}/usr/bin/agent-deck"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}"
}