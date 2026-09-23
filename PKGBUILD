pkgname=multica-bin
pkgver=0.5.2
pkgrel=1
pkgdesc="The open-source managed agents platform. Turn coding agents into real teammates — assign tasks, track progress, compound skills"
arch=(x86_64 aarch64)
url="https://github.com/multica-ai/multica"
license=(MIT)

depends=()
options=(!strip !debug)
conflicts=("multica")
provides=(multica)

source=("https://github.com/multica-ai/multica/releases/download/v0.5.2/multica-cli-0.5.2-linux-amd64.tar.gz")
sha256sums=('b124d798f776aab6b545f73ba96f0dceedb603607b05b8a6276fd347e0f0b511')

prepare() {
    tar -xf "${srcdir}/$(basename "${source}")"
}

package() {
    install -Dm755 "multica" "${pkgdir}/usr/bin/multica"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}"
}