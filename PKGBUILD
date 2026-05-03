pkgname=multica-bin
pkgver=0.2.24
pkgrel=1
pkgdesc="The open-source managed agents platform. Turn coding agents into real teammates — assign tasks, track progress, compound skills"
arch=(x86_64 aarch64)
url="https://github.com/multica-ai/multica"
license=(MIT)

depends=()
options=(!strip !debug)
conflicts=("multica")
provides=(multica)

source=("https://github.com/multica-ai/multica/releases/download/v0.2.24/multica-cli-0.2.24-linux-amd64.tar.gz")
sha256sums=('058386f695f5d4ecec18b13a278080a22e6edd9ef25c831debb23a1a43d398c0')

prepare() {
    tar -xf "${srcdir}/$(basename "${source}")"
}

package() {
    install -Dm755 "multica" "${pkgdir}/usr/bin/multica"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}"
}