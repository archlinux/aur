pkgname=multica-bin
pkgver=0.3.17
pkgrel=1
pkgdesc="The open-source managed agents platform. Turn coding agents into real teammates — assign tasks, track progress, compound skills"
arch=(x86_64 aarch64)
url="https://github.com/multica-ai/multica"
license=(MIT)

depends=()
options=(!strip !debug)
conflicts=("multica")
provides=(multica)

source=("https://github.com/multica-ai/multica/releases/download/v0.3.17/multica-cli-0.3.17-linux-amd64.tar.gz")
sha256sums=('8c64551c2eed1725972ab2fd48a27973469f5bc6946307e59cf47448db9a5955')

prepare() {
    tar -xf "${srcdir}/$(basename "${source}")"
}

package() {
    install -Dm755 "multica" "${pkgdir}/usr/bin/multica"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}"
}