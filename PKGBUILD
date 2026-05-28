# Maintainer: Alex Parrill <alex@col32.net>

pkgname=podcast-dl-bin
pkgver=11.7.5
pkgrel=1
pkgdesc="A humble CLI for downloading and archiving podcasts"
arch=('x86_64')
url="https://github.com/lightpohl/podcast-dl"
license=('MIT')
depends=("libstdc++" "libgcc")
optdepends=(
    "ffmpeg: post-processing"
)
source=(
    "podcast-dl::https://github.com/lightpohl/podcast-dl/releases/download/v${pkgver}/podcast-dl-${pkgver}-linux-x64"
)
sha256sums=(
    "8ad533722c2d4bcddbb195d7332011527dbacb4ec785abd326c651721e010713"
)
# Stripping breaks the binary
options=("!strip")

package() {
    install -Dm755 "${srcdir}/podcast-dl" "${pkgdir}/usr/bin/podcast-dl"
}
