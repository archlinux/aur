# Maintainer: AmarBego <begovicamar@proton.me>
pkgname=gittop-bin
pkgver=0.5.3
pkgrel=1
pkgdesc="A lightweight GitHub notifications client. Why spin up a browser just to check your GitHub notifications?"
arch=('x86_64' 'aarch64')
url="https://github.com/AmarBego/GitTop"
license=('AGPL-3.0-only')
provides=('gittop')
conflicts=('gittop')
depends=('gcc-libs')
options=('!strip' '!debug')
install=gittop.install
source_x86_64=("gittop-${pkgver}-linux-gnu-x86_64.tar.gz::https://github.com/AmarBego/GitTop/releases/download/v${pkgver}/gittop-${pkgver}-linux-gnu-x86_64.tar.gz")
source_aarch64=("gittop-${pkgver}-linux-gnu-aarch64.tar.gz::https://github.com/AmarBego/GitTop/releases/download/v${pkgver}/gittop-${pkgver}-linux-gnu-aarch64.tar.gz")
sha256sums_x86_64=('ee4e9c89f9a48262f1e6b0f09ea74bb59d6288c831ecbdb944c4ea30aaa69cda')
sha256sums_aarch64=('c325126dd539b158f7b6f1f43752fb99b9d702b3e56e9b05d9c4dc56f5b4f1a2')

package() {
    cd "${srcdir}/gittop-${pkgver}-linux-gnu-${CARCH}"
    install -Dm755 "gittop" "${pkgdir}/usr/bin/gittop"
    install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "README.txt" "${pkgdir}/usr/share/doc/${pkgname}/README.txt"
    install -Dm644 "gittop.desktop" "${pkgdir}/usr/share/applications/gittop.desktop"
    install -Dm644 "gittop.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/gittop.png"
    install -Dm644 "gittop.png" "${pkgdir}/usr/share/pixmaps/gittop.png"
}
