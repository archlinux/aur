pkgname=agent-deck-bin
pkgver=1.9.70
pkgrel=1
pkgdesc="Terminal session manager for AI coding agents"
arch=(x86_64 aarch64)
url="https://github.com/asheshgoplani/agent-deck"
license=(MIT)

depends=("tmux" "glibc")
options=(!strip !debug)
conflicts=("agent-deck")
provides=(agent-deck)

source=("https://github.com/asheshgoplani/agent-deck/releases/download/v1.9.70/agent-deck_1.9.70_linux_amd64.tar.gz")
sha256sums=('29b5349b7b1f10e376a98d894bf3e7780be5724906e13c31a771e1d1e6263e0b')

prepare() {
    tar -xf "${srcdir}/$(basename "${source}")"
}

package() {
    install -Dm755 "agent-deck" "${pkgdir}/usr/bin/agent-deck"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}"
}